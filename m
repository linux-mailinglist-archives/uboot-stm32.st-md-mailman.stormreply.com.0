Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA56463A346
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Nov 2022 09:41:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97909C6507A;
	Mon, 28 Nov 2022 08:41:41 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FDEDC63325
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 08:41:40 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z18so14391466edb.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 00:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TC0T9OkyLy+fI7+EhilYnNH3p+JlTMoNkHGjGbBu3P8=;
 b=ZTvlDom66YrwMUrzIDzS3FrQDST3QcC98O806K2xQbZewwfptMsdKLyZT6bBFKI3Ip
 QpX/J+aZ+OGMq7iF1fNQ3VrE9IQlFS8y2s2NhRqJsEoCxsfDH2vXzmUFJpqj9QLxnK7W
 BpUNWzuBakAi+1vAgyewpTagbeUivTYJZS9gaas8tb2HboK/nvVxpaUvQtDx4ZkRms3c
 pvoD2yrtP5oWMZg1V2BKzE0Q+UFv5uDSvJltxNnJkNkgPkLTAXsPrU5j/ukuucYVnC2u
 O+MZDtbb9uqUD7uRrm7nDMOykRT93qYxBlqYNaHPRKLujsO4metJQ3c0HRN/LK+YHG5e
 CfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TC0T9OkyLy+fI7+EhilYnNH3p+JlTMoNkHGjGbBu3P8=;
 b=MH0jlPA9mK+XC+P3q8OeAhnUUZKke0IVgisXbPRiCoMKxFzPZbEqGmLVSOE00wSzsJ
 c7c08yoENugXXLNZjAW4Bq2bGnngfRdTYyEHPf+DxfavsC2Z4moEO5+0k0anj00iJ2zU
 /bc/7jDXFmVNOgOPOoGZmeeV5fKtLHYXXIc8/LiT6feIYmx3nG8c/CUmh5BTONFCfV2T
 +KSJ7bDakr80TU6BE7LGNW+9zD5+rI4j3XBiW1nJWrJDzdW+DzoYoxl95jFnA611396b
 c6yCMt5zTjORqPX8P//380CusKqMfq2pllRqy2kscxX6iStwkJgnY4HZy8qIAHKW9XBz
 sM3w==
X-Gm-Message-State: ANoB5pnOfkHn/AI1PCua4ex0iK/MWDBtbsJPKOKSKG1svs9LPae0GXm1
 z0Zip2i7YNzIEUIc6hjNFDE=
X-Google-Smtp-Source: AA0mqf4PRo5tD2rCOkNHi/O19JIXWPz5CnAbOuW2onPptoRordEunrIwVJbl1eCMmtYvgST5maLh5Q==
X-Received: by 2002:a05:6402:5021:b0:460:5340:d522 with SMTP id
 p33-20020a056402502100b004605340d522mr34834518eda.87.1669624899583; 
 Mon, 28 Nov 2022 00:41:39 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 cd10-20020a170906b34a00b007aa239cf4d9sm4671961ejb.89.2022.11.28.00.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 00:41:39 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 28 Nov 2022 09:41:21 +0100
Message-Id: <20221128084122.3456680-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Du Huanpeng <dhu@hodcarrier.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Adam Ford <aford173@gmail.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Samuel Holland <samuel@sholland.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Stefan Roese <sr@denx.de>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v5 0/1] Makefile: rework u-boot-initial-env
	target
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

RnJvbTogTWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1tZW5hY2hlckB0b3JhZGV4LmNvbT4KCgpX
aXRoIENPTkZJR19MVE8gZW5hYmxlZCB0aGUgY3VycmVudCB3YXkgb2YgZXh0cmFjdGluZyB0aGUK
Y29uZmlndXJlZCBlbnZpcm9ubWVudCBubyBsb25nZXIgd29ya3MsIGkuZS4gdGhlIG9iamVjdCBm
aWxlCmNvbnRlbnQgY2hhbmdlcyBkdWUgdG8gTFRPLgoKQnVpbGQgYSBob3N0IHRvb2wgd2hpY2gg
cHJpbnRzIHRoZSBjb25maWd1cmVkIGVudmlyb25tZW50IGluc3RlYWQKb2YgdXNpbmcgb2JqY29w
eSBhbmQgZnJpZW5kcyB0byBhY2hpdmUgdGhlIHNhbWUuCgpUaGUgY29kZSBhbmQgTWFrZWZpbGUg
Y2hhbmdlcyB3ZXJlIG1vc3RseSBzdG9sZW4gZnJvbSB0b29scy9lbnYvCmkuZS4gdGhlIHRhcmdl
dCB1c2Vyc3BhY2UgdG9vbHMgdG8gYWNjZXNzIHRoZSBlbnZpcm9ubWVudC4KCgpDaGFuZ2VzIGlu
IHY1OgotIGRvbid0IGJ1aWxkIHRoZSBwcmludGluaXRpYWxlbnYgdG9vbCB1bmNvbmRpdGlvbmFs
bHkgYnV0IGJ1aWxkIGl0CiAgb25seSBhcyBwYXJ0IG9mIHRoZSB1LWJvb3QtaW5pdGlhbC1lbnYg
dGFyZ2V0LgogIFRoaXMgbm8gbG9uZ2VyIGZhaWxzIHRoZSAnbWFrZSB0b29scy1vbmx5X2RlZmNv
bmZpZyB0b29scy1vbmx5JwogIHVzZS1jYXNlIHdoaWNoIGlzIHJlcG9ydGVkIGJ5IFRvbSBSaW5p
LgogIEFkZGluZyB0aGUgJChlbnZfaCkgZGVwZW5kZW5jaWVzIHRvIHRoZSB0b29scyB0YXJnZXQg
bWlnaHQgZ2l2ZQogIGNpcmN1bGFyIGRlcGVuZGVuY2llcyBpc3N1ZXMgd2l0aCBzb21lIGZ1dHVy
ZSB0b29sLgotIGFkZCBBY2tlZC1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4KCkNo
YW5nZXMgaW4gdjQ6Ci0gYWRkICcob2JqdHJlZSkvJyB3aGVuIGNhbGxpbmcgdGhlIHRvb2wuIFN1
Z2dlc3RlZCBieSBQYWxpIFJvaMOhci4KLSByZW5hbWVkIHBhdGNoLCBhcyBtb3JlIHRoYW4ganVz
dCB0aGUgTWFrZWZpbGUgaGFzIGNoYW5nZXMKCkNoYW5nZXMgaW4gdjM6Ci0gbW92ZWQgdGhlIHRv
b2wgZnJvbSBzY3JpcHRzLyB0byB0b29scy8uIFN1Z2dlc3RlZCBieSBUb20gUmluaQotIGNoYW5n
ZWQgdGhlIGRlcGVuZGVuY2llcyB0byAnJChlbnZfaCknIGFuZCAndG9vbHMnLgogIFN1Z2dlc3Rl
ZCBieSBUb20gUmluaSBhbmQgUGFsaSBSb2jDoXIuCi0gcmVtb3ZlZCB0aGUgc2VkIHJ1bGUgd2hp
Y2ggcmVwbGFjZXMgXHgwMCB3aXRoIFx4MEEgYXMgdGhpcyBpcyBhbHJlYWR5CiAgZG9uZSBieSB0
aGUgdG9vbC4gU3VnZ2VzdGVkIGJ5IFBhbGkgUm9ow6FyLgoKQ2hhbmdlcyBpbiB2MjoKLSByZXdv
cmtlZCB0byBidWlsZCBhIGhvc3QgdG9vbCB3aGljaCBwcmludHMgdGhlIGNvbmZpZ3VyZWQKICBl
bnZpcm9ubWVudCBhcyBwcm9wb3NlZCBieSBQYWxpIFJvaMOhcgogIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3UtYm9vdC8yMDIyMTAxODE3NDgyNy4xMzkzMjExLTEtbWF4Lm9zcy4wOUBnbWFpbC5j
b20vCi0gcmVuYW1lZCBwYXRjaCwgdjEgdXNlZCAiTWFrZWZpbGU6IGZpeCB1LWJvb3QtaW5pdGlh
bC1lbnYgdGFyZ2V0IGlmIGx0byBpcyBlbmFibGVkIgoKTWF4IEtydW1tZW5hY2hlciAoMSk6CiAg
dS1ib290LWluaXRpYWwtZW52OiByZXdvcmsgbWFrZSB0YXJnZXQKCiBNYWtlZmlsZSAgICAgICAg
ICAgICAgICB8IDEwICsrKysrKy0tLS0KIHRvb2xzLy5naXRpZ25vcmUgICAgICAgIHwgIDEgKwog
dG9vbHMvTWFrZWZpbGUgICAgICAgICAgfCAgNCArKysrCiB0b29scy9wcmludGluaXRpYWxlbnYu
YyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVz
IGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAx
MDA2NDQgdG9vbHMvcHJpbnRpbml0aWFsZW52LmMKCi0tIAoyLjM1LjMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlz
dApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
