Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2E620B89
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Nov 2022 09:53:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 549FEC6504B;
	Tue,  8 Nov 2022 08:53:10 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF236C03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Nov 2022 08:53:08 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id n12so36666420eja.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Nov 2022 00:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5u1OpYaPZrxJtzaWHIFrzbbgvj5Zti7pd/jv4Fk6JxQ=;
 b=DMXtESO0lY5McovsPr1Dj+R/IZmTf9uRf+Mdzcx+SHuL7Y1akEpvdG1iaNFWNOL5i2
 7jfv7Nyhgd7EEUmN3b+CjVqjgekAig9qCJNZlCRDD1L6zhtarNt3oYgBzXC2XMGbosS/
 x/h1k2QsR1QnfSRu5hak8RRoNFpLCfjTz5nIrvPRocpdzQlwgvMSpOl+rNMWdUfEAMOr
 Xr3jM0c7l6B1vJPofXWuzw1UusvA6xw4jdmvV+tvzXx8a0bUndniALWjs8M4x8ni2p3B
 NalJdpxVBd37V3qzSt3sIh3Ldntal1QsJM0WHkPGzTKo4Op2Dr+KVfu4pVoF+qCZCd/W
 yfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5u1OpYaPZrxJtzaWHIFrzbbgvj5Zti7pd/jv4Fk6JxQ=;
 b=Yr35iuR+Zv8mtnjtxMr0yqWkz5XEnOEwfexn/5wdJMA2of7qsT6o/xKCGqE7nyv6UK
 lJUKSj73lhBkr4CfCalr0I89WR4u/S3fY9CTDNnRX0WPbYrJTnmEA1xqgjoTXuYqX3HD
 k+cgypTcuHzQL02bsURCbgLNpxVRGTUns+8rPtRD1gSL8dREd8asJFDwKuX392WEcc35
 YeCMIPL5KudK7rm2WwgvUKf5nAwky9Y/YlK6PwAPCtGN1kiUrHUxWi4ikCyb8vxVpXx3
 23amE8RJYHob8D16NBFlh7KmGiYXGEUuJFhWUyhqSH6mT7gTZqQXqD8A5z11UyqVzJO6
 +BSA==
X-Gm-Message-State: ACrzQf1WXM2TOWIUZhvIngmPD4BETWJSzZf6pWsBSEmuHNevpfnn5kmy
 zZeqI4QfrQ4TMrC3noRTurE=
X-Google-Smtp-Source: AMsMyM61qSazAODzPYCHDrtBvoNG56p00OzqMNS3lpxwN2IqC8F2yK3Gd4bf7cj7bOsJ7T2fpYfFKw==
X-Received: by 2002:a17:906:8a47:b0:7a5:8160:19a6 with SMTP id
 gx7-20020a1709068a4700b007a5816019a6mr53202150ejc.477.1667897588421; 
 Tue, 08 Nov 2022 00:53:08 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 s18-20020aa7c552000000b00461c1804cdasm5303628edr.3.2022.11.08.00.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 00:53:08 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: u-boot@lists.denx.de
Date: Tue,  8 Nov 2022 09:52:21 +0100
Message-Id: <20221108085222.1378781-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Du Huanpeng <dhu@hodcarrier.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Adam Ford <aford173@gmail.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Samuel Holland <samuel@sholland.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Stefan Roese <sr@denx.de>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v4 0/1] Makefile: rework u-boot-initial-env
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
IHY0OgotIGFkZCAnKG9ianRyZWUpLycgd2hlbiBjYWxsaW5nIHRoZSB0b29sLiBTdWdnZXN0ZWQg
YnkgUGFsaSBSb2jDoXIuCi0gcmVuYW1lZCBwYXRjaCwgYXMgbW9yZSB0aGFuIGp1c3QgdGhlIE1h
a2VmaWxlIGhhcyBjaGFuZ2VzCgpDaGFuZ2VzIGluIHYzOgotIG1vdmVkIHRoZSB0b29sIGZyb20g
c2NyaXB0cy8gdG8gdG9vbHMvLiBTdWdnZXN0ZWQgYnkgVG9tIFJpbmkKLSBjaGFuZ2VkIHRoZSBk
ZXBlbmRlbmNpZXMgdG8gJyQoZW52X2gpJyBhbmQgJ3Rvb2xzJy4KICBTdWdnZXN0ZWQgYnkgVG9t
IFJpbmkgYW5kIFBhbGkgUm9ow6FyLgotIHJlbW92ZWQgdGhlIHNlZCBydWxlIHdoaWNoIHJlcGxh
Y2VzIFx4MDAgd2l0aCBceDBBIGFzIHRoaXMgaXMgYWxyZWFkeQogIGRvbmUgYnkgdGhlIHRvb2wu
IFN1Z2dlc3RlZCBieSBQYWxpIFJvaMOhci4KCkNoYW5nZXMgaW4gdjI6Ci0gcmV3b3JrZWQgdG8g
YnVpbGQgYSBob3N0IHRvb2wgd2hpY2ggcHJpbnRzIHRoZSBjb25maWd1cmVkCiAgZW52aXJvbm1l
bnQgYXMgcHJvcG9zZWQgYnkgUGFsaSBSb2jDoXIKICBodHRwczovL2xvcmUua2VybmVsLm9yZy91
LWJvb3QvMjAyMjEwMTgxNzQ4MjcuMTM5MzIxMS0xLW1heC5vc3MuMDlAZ21haWwuY29tLwotIHJl
bmFtZWQgcGF0Y2gsIHYxIHVzZWQgIk1ha2VmaWxlOiBmaXggdS1ib290LWluaXRpYWwtZW52IHRh
cmdldCBpZiBsdG8gaXMgZW5hYmxlZCIKCk1heCBLcnVtbWVuYWNoZXIgKDEpOgogIHUtYm9vdC1p
bml0aWFsLWVudjogcmV3b3JrIG1ha2UgdGFyZ2V0CgogTWFrZWZpbGUgICAgICAgICAgICAgICAg
fCAgOSArKysrKy0tLS0KIHRvb2xzLy5naXRpZ25vcmUgICAgICAgIHwgIDEgKwogdG9vbHMvTWFr
ZWZpbGUgICAgICAgICAgfCAgMyArKysKIHRvb2xzL3ByaW50aW5pdGlhbGVudi5jIHwgNDQgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwg
NTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy9wcmludGluaXRpYWxlbnYuYwoKLS0gCjIuMzUuMwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
