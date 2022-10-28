Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E4D611768
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Oct 2022 18:20:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73857C640F5;
	Fri, 28 Oct 2022 16:20:21 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22CB3C0AA15
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 16:20:20 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id ud5so14132284ejc.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 09:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7xB0H1DwRgEkn3/xDPq05dYiQ9GZouPw98phwKVDGus=;
 b=nw4/RiwPbhqNM0BX4/TxN1WMYE7oDc61iRfhDO+/8Td54nTCpEsj1hMHBPwqgSsbZZ
 FuvyNAFcg1VwEVbwLh/ZOjaOPveO5eo2gyqnSJL9T21CXc8ltSSgahShBfpyWliQj/v7
 F/pMgWiwD8Ep8TFXDcF6PQULW2HxSBs7cas8pYxZX4SAyki26f3cfZlOciIBQClFQGHz
 mrEfAYjnQ4yE7nf/psJL5yvFj6LAlYjlaUZ7gdyAn59ohUDobrpaMOiPbuhr6kbxIB0p
 3MBcjNdMZ752oISLwem3BUyw5WIrmMNQB4FS2F6b6TmZldtOf8zPPQR1OV7jd6YKYr+V
 EUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7xB0H1DwRgEkn3/xDPq05dYiQ9GZouPw98phwKVDGus=;
 b=wOIyj5sS6B3gMQqm1BgqsGqhW0z8h10jOqx7QEaon3tanCAn5mFCRpEQbaQt70qMWp
 icjYgCgjG5VUTWP7Ry9Ii/wb0PrIjXOidtIAQ4K0NVIQTn+LAWnu9ovhrSkwcSicxEO5
 U3Rj8IZkT3jAts0uidUuqXjr73umxJNwtO+1RRl3kk7MQO8kuNUOSib2mWMQKRwfh9Sw
 GJeqTckkhItuY+o6bydmPIbbGrukQDIMyCxvVQcv2c9owlwbQN+iV56gFkAlxyrles9x
 JMplOFhD6xvhU8TfLARtZ00yZmrqNroonm3EnJbjVZ1oqJ6POs7cV4xnnXlQoYxNXPCN
 7wYQ==
X-Gm-Message-State: ACrzQf1agx8IKKX2dZIPcuvUEw6+g19icV1wTsI9FORRig0fRrVN//31
 1wiOrKJL07nE0tWf9OBZKgM=
X-Google-Smtp-Source: AMsMyM4Z18SI2db0e7lb+oJ25eoJ8rsbsKKKlJsaGst7jFwfZ5yK7zek4ZFHTued7c7ng4/sKYq6nw==
X-Received: by 2002:a17:907:743:b0:740:ef93:2ffc with SMTP id
 xc3-20020a170907074300b00740ef932ffcmr126671ejb.514.1666974019560; 
 Fri, 28 Oct 2022 09:20:19 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 le5-20020a170907170500b00781e7d364ebsm2458478ejc.144.2022.10.28.09.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:20:19 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: u-boot@lists.denx.de
Date: Fri, 28 Oct 2022 18:18:48 +0200
Message-Id: <20221028161850.565610-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Adam Ford <aford173@gmail.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v2 0/1] Makefile: rework u-boot-initial-env
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
IHYyOgotIHJld29ya2VkIHRvIGJ1aWxkIGEgaG9zdCB0b29sIHdoaWNoIHByaW50cyB0aGUgY29u
ZmlndXJlZAogIGVudmlyb25tZW50IGFzIHByb3Bvc2VkIGJ5IFBhbGkgUm9ow6FyCiAgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvdS1ib290LzIwMjIxMDE4MTc0ODI3LjEzOTMyMTEtMS1tYXgub3Nz
LjA5QGdtYWlsLmNvbS8KLSByZW5hbWVkIHBhdGNoLCB2MSB1c2VkICJNYWtlZmlsZTogZml4IHUt
Ym9vdC1pbml0aWFsLWVudiB0YXJnZXQgaWYgbHRvIGlzIGVuYWJsZWQiCgpNYXggS3J1bW1lbmFj
aGVyICgxKToKICBNYWtlZmlsZTogcmV3b3JrIHUtYm9vdC1pbml0aWFsLWVudiB0YXJnZXQKCiBN
YWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgIDcgKysrKy0tLQogc2NyaXB0cy8uZ2l0aWdub3Jl
ICAgICAgICB8ICAxICsKIHNjcmlwdHMvTWFrZWZpbGUgICAgICAgICAgfCAgNSArKysrKwogc2Ny
aXB0cy9wcmludGluaXRpYWxlbnYuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlwdHMvcHJpbnRpbml0aWFsZW52LmMKCi0tIAoy
LjM1LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
