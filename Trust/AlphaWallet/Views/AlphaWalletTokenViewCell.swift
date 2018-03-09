// Copyright © 2018 Stormbird PTE. LTD.

import Foundation
import UIKit
import Kingfisher

class AlphaWalletTokenViewCell: UITableViewCell {
    static let identifier = "AlphaWalletTokenViewCell"

    let background = UIView()
    let titleLabel = UILabel()
    let blockchainLabel = UILabel()
    let separator = UILabel()
    let issuerLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false

        let bottomRowStack = UIStackView(arrangedSubviews: [blockchainLabel, separator, issuerLabel])
        bottomRowStack.axis = .horizontal
        bottomRowStack.spacing = 15
        bottomRowStack.distribution = .fill

        let stackView = UIStackView(arrangedSubviews: [titleLabel, bottomRowStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.alignment = .leading
        background.addSubview(stackView)

        // TODO extract constant. Maybe StyleLayout.sideMargin
        let xMargin  = CGFloat(7)
        let yMargin  = CGFloat(20)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 21),
            stackView.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -21),
            stackView.topAnchor.constraint(equalTo: background.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: background.bottomAnchor, constant: -16),

            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xMargin),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xMargin),
            background.topAnchor.constraint(equalTo: topAnchor, constant: yMargin),
            background.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -yMargin),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(viewModel: AlphaWalletTokenViewCellViewModel) {
        selectionStyle = .none
        backgroundColor = viewModel.backgroundColor

        background.backgroundColor = viewModel.contentsBackgroundColor
        background.layer.cornerRadius = 20

        contentView.backgroundColor = viewModel.backgroundColor

        titleLabel.textColor = viewModel.titleColor
        titleLabel.font = viewModel.titleFont
        titleLabel.text = "\(viewModel.amount) \(viewModel.title)"

        blockchainLabel.textColor = viewModel.subtitleColor
        blockchainLabel.font = viewModel.subtitleFont
        blockchainLabel.text = viewModel.blockChainName

        issuerLabel.textColor = viewModel.subtitleColor
        issuerLabel.font = viewModel.subtitleFont
        issuerLabel.text = viewModel.issuer

        separator.textColor = viewModel.subtitleColor
        separator.font = viewModel.subtitleFont
        separator.text = "|"
    }
}