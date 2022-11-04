Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5CC619670
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Nov 2022 13:45:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C0F1C6411F;
	Fri,  4 Nov 2022 12:45:58 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3177AC035BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 12:45:57 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id sc25so12884080ejc.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Nov 2022 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dauT37ooORUnE2VvxPsPLfo21emq7obUM2DgYST2wh0=;
 b=pP9BZZstLpvvMTX0rSwF9d5ad2VkWw8wqpaTiKRQHuhiPWOILDvLDj54AR3CYwtKpy
 VDnqw3+4tjKOnNG88yPGoh8rKQ9s+Gh3BFDFoDPrc/E97Y42CnGox+6VYQ7GNLNbyHx+
 Cgc90OeIbZtHULHhXuMMjKi+6nYbdz9Fff8lhGJvx9YuKj8JEkSC8kxPuCr1W8DSUjjq
 bn/oH2W9qsJu9M+yC3ye3w0sJU2iLu9MHHSYtWWMZDd157wain47gW99H1C99AcyO/pT
 XsiQ5h6cqPlRU5hSGhl6uE653ISmlzGrJzDTi664fYfHD84yuohT0uT0JMLptoj3ioo3
 gPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dauT37ooORUnE2VvxPsPLfo21emq7obUM2DgYST2wh0=;
 b=PpZk6svr8MOMAnX+wgNErw9rNAZ2ZU4xb4++ej2bllAH1tNpKZiHNHz4i5eKmcaK8K
 jwPx4Oq2/GnQE14TBNL7uk3V8NoQr05yDtCW/4wgnck88dMZJlmAj49Tt4kNsgWcPW1K
 j7sE2cmFfjedPiPIkuvBOBcH0z8AGknIflAjDSyPqPUzG4i+8jY9BbR7gfMNJSS3Prew
 yOfcNiUXEaOENwnKGucDleKacX4nMQGtXKs6uzEUnUQbmCGNxZyHCVKCUwGLNIua/+bw
 teti9b5R3UTGXTIgoVFCd8skDuvIqW5fnUd8IaNpjli6kotLdyYwTfCdfUS5y5o3Jknr
 pPpA==
X-Gm-Message-State: ACrzQf1NHx/XNk9BppNXJBsGe5lm+A4DdO6L69U3TX25voJhDTbl3u5j
 zcYZRBNyzDUqc2JBDJSbeCI=
X-Google-Smtp-Source: AMsMyM6tJgUue+lYGvGG4sj3zmQUkUnNGl+FyKzJu9pr9M3q9DDCahIXwLRG00nh9lb0d3Tg+luWLw==
X-Received: by 2002:a17:906:9bee:b0:7ad:c4a1:b8e4 with SMTP id
 de46-20020a1709069bee00b007adc4a1b8e4mr30384092ejc.283.1667565956611; 
 Fri, 04 Nov 2022 05:45:56 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 t26-20020aa7db1a000000b0045ce419ecffsm1898105eds.58.2022.11.04.05.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 05:45:56 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: u-boot@lists.denx.de
Date: Fri,  4 Nov 2022 13:44:56 +0100
Message-Id: <20221104124458.890133-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Du Huanpeng <dhu@hodcarrier.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Adam Ford <aford173@gmail.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Samuel Holland <samuel@sholland.org>, Weijie Gao <weijie.gao@mediatek.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Stefan Roese <sr@denx.de>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v3 0/1] Makefile: rework u-boot-initial-env
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
IHYzOgotIG1vdmVkIHRoZSB0b29sIGZyb20gc2NyaXB0cy8gdG8gdG9vbHMvLiBTdWdnZXN0ZWQg
YnkgVG9tIFJpbmkKLSBjaGFuZ2VkIHRoZSBkZXBlbmRlbmNpZXMgdG8gJyQoZW52X2gpJyBhbmQg
J3Rvb2xzJy4KICBTdWdnZXN0ZWQgYnkgVG9tIFJpbmkgYW5kIFBhbGkgUm9ow6FyLgotIHJlbW92
ZWQgdGhlIHNlZCBydWxlIHdoaWNoIHJlcGxhY2VzIFx4MDAgd2l0aCBceDBBIGFzIHRoaXMgaXMg
YWxyZWFkeQogIGRvbmUgYnkgdGhlIHRvb2wuIFN1Z2dlc3RlZCBieSBQYWxpIFJvaMOhci4KCkNo
YW5nZXMgaW4gdjI6Ci0gcmV3b3JrZWQgdG8gYnVpbGQgYSBob3N0IHRvb2wgd2hpY2ggcHJpbnRz
IHRoZSBjb25maWd1cmVkCiAgZW52aXJvbm1lbnQgYXMgcHJvcG9zZWQgYnkgUGFsaSBSb2jDoXIK
ICBodHRwczovL2xvcmUua2VybmVsLm9yZy91LWJvb3QvMjAyMjEwMTgxNzQ4MjcuMTM5MzIxMS0x
LW1heC5vc3MuMDlAZ21haWwuY29tLwotIHJlbmFtZWQgcGF0Y2gsIHYxIHVzZWQgIk1ha2VmaWxl
OiBmaXggdS1ib290LWluaXRpYWwtZW52IHRhcmdldCBpZiBsdG8gaXMgZW5hYmxlZCIKCk1heCBL
cnVtbWVuYWNoZXIgKDEpOgogIE1ha2VmaWxlOiByZXdvcmsgdS1ib290LWluaXRpYWwtZW52IHRh
cmdldAoKIE1ha2VmaWxlICAgICAgICAgICAgICAgIHwgIDkgKysrKystLS0tCiB0b29scy8uZ2l0
aWdub3JlICAgICAgICB8ICAxICsKIHRvb2xzL01ha2VmaWxlICAgICAgICAgIHwgIDMgKysrCiB0
b29scy9wcmludGluaXRpYWxlbnYuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcHJpbnRpbml0aWFsZW52LmMKCi0tIAoy
LjM1LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
