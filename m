Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E80620B8A
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Nov 2022 09:53:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E0C7C6504C;
	Tue,  8 Nov 2022 08:53:11 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33EB2C65041
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Nov 2022 08:53:10 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id ft34so396089ejc.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Nov 2022 00:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhSt0IM4DKvGxdjJPXT3qNiT0HPqjT7VAxKRE5pTW2Y=;
 b=RHfx3tNAH5Sh7HUMeIVt/A7OEGGZUyCE5EGdlZgtA78AlLkzeGYfqc54Bn0i+1G97g
 +HpgaTHXugblQsu07PdldhL1iQ3abSeoPnmPtkJ0IMWde4W3JdEmAlaseYMb89DlOPH6
 5VZ8GbywMlhIjKNkEg1BeZE/1/LtBC9xTGpSEMwgSSVKV4nrAYYuWzNxx2OeH17F5g3h
 BCLdzleKA8zzy1Ef9UvrKowZI+A4JMrS2Vqgqdby5ZSlK98lK2k7RkRoRM0l6E854F4U
 7kc/G5AD/j6XKNSz74FH4w0ED0F4HnfB4DygrSoE/ZqsHM97+Q9xnTf6cfz1+55MD6/d
 66sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZhSt0IM4DKvGxdjJPXT3qNiT0HPqjT7VAxKRE5pTW2Y=;
 b=jhswKiZLWh9jPZ7lcORB61FPgATD0wygzuBSV7U2BhgTr0eHcIIZXzLXyCcMwvHrYM
 NF1T61kFmhAE/tZOo8O2lL+4o7KnFddLuXITZW70M2390VB0nWzLhVdvHBLV/g76UuN0
 +/C8CkkgLot0HZEQSujZ+kKaBEW0lV0J7HC50Ix3Auz0GzEmvc7/9ag123Bv9X6HR8X9
 BPAm/I3VRBH9CdIUKgZ5vHF/ApeRLmudZPHCY0XGf5ps2LUJMTHFOCNiyzgVsl4lTS/r
 953xcN0oNOdFaC4ZjOuosXfpkAXi+5kqZmO20oaPnU4lBo8mE6aAvBzAQsoSpQmxYL+B
 FVog==
X-Gm-Message-State: ANoB5pmL58xmXC/3z6B9T7QmEXXTNcK9XwnFDFQqpe2vq4NBUMJw7Xjg
 Tu++ecAVqPLVBj2u13hopwg=
X-Google-Smtp-Source: AA0mqf6fvUzEePo2i9Ks0WP9tZsKpjYxHnpT4BXhtwtioYVjKTh3T2O6Z0d9yXn8bQY8JQACaNODeg==
X-Received: by 2002:a17:907:c208:b0:7ad:a0df:d4c7 with SMTP id
 ti8-20020a170907c20800b007ada0dfd4c7mr9273446ejc.312.1667897589838; 
 Tue, 08 Nov 2022 00:53:09 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 s18-20020aa7c552000000b00461c1804cdasm5303628edr.3.2022.11.08.00.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 00:53:09 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: u-boot@lists.denx.de
Date: Tue,  8 Nov 2022 09:52:22 +0100
Message-Id: <20221108085222.1378781-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221108085222.1378781-1-max.oss.09@gmail.com>
References: <20221108085222.1378781-1-max.oss.09@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v4 1/1] u-boot-initial-env: rework make target
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

RnJvbTogTWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1tZW5hY2hlckB0b3JhZGV4LmNvbT4KCldp
dGggTFRPIGVuYWJsZWQgdGhlIFUtQm9vdCBpbml0aWFsIGVudmlyb25tZW50IGlzIG5vIGxvbmdl
ciBzdG9yZWQKaW4gYW4gZWFzeSBhY2Nlc3NpYmxlIHNlY3Rpb24gaW4gZW52L2NvbW1vbi5vLiBJ
LmUuIHRoZSBzZWN0aW9uIG5hbWUKY2hhbmdlcyBmcm9tIGJ1aWxkIHRvIGJ1aWxkLCBpdHMgY29u
dGVudCBtYXliZSBjb21wcmVzc2VkIGFuZCBpdCBpcwphbm5vdGF0ZWQgd2l0aCBhZGRpdGlvbmFs
IGRhdGEuCgpEcm9wIHRyeWluZyB0byByZWFkIHRoZSBpbml0aWFsIGVudiB3aXRoIGVsZiB0b29s
cyBmcm9tIHRoZSBjb21waWxlcgpzcGVjaWZpYyBvYmplY3QgZmlsZSBpbiBmYXZvdXIgb2YgYWRk
aW5nIGFuZCB1c2luZyBhIGhvc3QgdG9vbCB3aXRoCnRoZSBvbmx5IGZ1bmN0aW9uYWxpdHkgb2Yg
cHJpbnRpbmcgdGhlIGluaXRpYWwgZW52IHRvIHN0ZG91dC4KClNlZSBhbHNvOgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvOTI3YjEyMmUtMWY2Mi1lNzkwLWY1Y2EtMzBiYWU0MzMyYzc3QGZv
c3Muc3QuY29tLwoKU2lnbmVkLW9mZi1ieTogTWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1tZW5h
Y2hlckB0b3JhZGV4LmNvbT4KCi0tLQoKQ2hhbmdlcyBpbiB2NDoKLSBhZGQgJyhvYmp0cmVlKS8n
IHdoZW4gY2FsbGluZyB0aGUgdG9vbC4gU3VnZ2VzdGVkIGJ5IFBhbGkgUm9ow6FyLgotIHJlbmFt
ZWQgcGF0Y2gsIGFzIG1vcmUgdGhhbiBqdXN0IHRoZSBNYWtlZmlsZSBoYXMgY2hhbmdlcwoKQ2hh
bmdlcyBpbiB2MzoKLSBtb3ZlZCB0aGUgdG9vbCBmcm9tIHNjcmlwdHMvIHRvIHRvb2xzLy4gU3Vn
Z2VzdGVkIGJ5IFRvbSBSaW5pCi0gY2hhbmdlZCB0aGUgZGVwZW5kZW5jaWVzIHRvICckKGVudl9o
KScgYW5kICd0b29scycuCiAgU3VnZ2VzdGVkIGJ5IFRvbSBSaW5pIGFuZCBQYWxpIFJvaMOhci4K
LSByZW1vdmVkIHRoZSBzZWQgcnVsZSB3aGljaCByZXBsYWNlcyBceDAwIHdpdGggXHgwQSBhcyB0
aGlzIGlzIGFscmVhZHkKICBkb25lIGJ5IHRoZSB0b29sLiBTdWdnZXN0ZWQgYnkgUGFsaSBSb2jD
oXIuCgpDaGFuZ2VzIGluIHYyOgotIHJld29ya2VkIHRvIGJ1aWxkIGEgaG9zdCB0b29sIHdoaWNo
IHByaW50cyB0aGUgY29uZmlndXJlZAogIGVudmlyb25tZW50IGFzIHByb3Bvc2VkIGJ5IFBhbGkg
Um9ow6FyCiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdS1ib290LzIwMjIxMDE4MTc0ODI3LjEz
OTMyMTEtMS1tYXgub3NzLjA5QGdtYWlsLmNvbS8KLSByZW5hbWVkIHBhdGNoLCB2MSB1c2VkICJN
YWtlZmlsZTogZml4IHUtYm9vdC1pbml0aWFsLWVudiB0YXJnZXQgaWYgbHRvIGlzIGVuYWJsZWQi
CgogTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgOSArKysrKy0tLS0KIHRvb2xzLy5naXRpZ25v
cmUgICAgICAgIHwgIDEgKwogdG9vbHMvTWFrZWZpbGUgICAgICAgICAgfCAgMyArKysKIHRvb2xz
L3ByaW50aW5pdGlhbGVudi5jIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wcmludGluaXRpYWxlbnYuYwoKZGlmZiAtLWdp
dCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggMGYxMTc0NzE4ZjcuLmMwNjY5ODQwZGM3IDEw
MDY0NAotLS0gYS9NYWtlZmlsZQorKysgYi9NYWtlZmlsZQpAQCAtMjQ0MiwxMSArMjQ0MiwxMiBA
QCBlbmRpZgogCSQoUSkkKE1BS0UpIC1mICQoc3JjdHJlZSkvc2NyaXB0cy9NYWtlZmlsZS5tb2Rw
b3N0CiAKIHF1aWV0X2NtZF9nZW5lbnYgPSBHRU5FTlYgICRACi1jbWRfZ2VuZW52ID0gJChPQkpD
T1BZKSAtLWR1bXAtc2VjdGlvbiAucm9kYXRhLmRlZmF1bHRfZW52aXJvbm1lbnQ9JEAgZW52L2Nv
bW1vbi5vOyBcCi0Jc2VkIC0taW4tcGxhY2UgLWUgJ3MvXHgwMC9ceDBBL2cnICRAOyBzZWQgLS1p
bi1wbGFjZSAtZSAnL15ccyokJC9kJyAkQDsgXAotCXNvcnQgLS1maWVsZC1zZXBhcmF0b3I9PSAt
azEsMSAtLXN0YWJsZSAkQCAtbyAkQAorY21kX2dlbmVudiA9IFwKKwkkKG9ianRyZWUpL3Rvb2xz
L3ByaW50aW5pdGlhbGVudiB8IFwKKwlzZWQgLWUgJy9eXHMqJCQvZCcgfCBcCisJc29ydCAtLWZp
ZWxkLXNlcGFyYXRvcj09IC1rMSwxIC0tc3RhYmxlIC1vICRACiAKLXUtYm9vdC1pbml0aWFsLWVu
djogdS1ib290LmJpbgordS1ib290LWluaXRpYWwtZW52OiAkKGVudl9oKSB0b29scyBGT1JDRQog
CSQoY2FsbCBpZl9jaGFuZ2VkLGdlbmVudikKIAogIyBDb25zaXN0ZW5jeSBjaGVja3MKZGlmZiAt
LWdpdCBhL3Rvb2xzLy5naXRpZ25vcmUgYi90b29scy8uZ2l0aWdub3JlCmluZGV4IGQzYTkzZmYy
OTRhLi4yOGU4Y2UyYTA3YSAxMDA2NDQKLS0tIGEvdG9vbHMvLmdpdGlnbm9yZQorKysgYi90b29s
cy8uZ2l0aWdub3JlCkBAIC0yOCw2ICsyOCw3IEBACiAvbXhzYm9vdAogL25jYgogL3ByZWxpbmst
cmlzY3YKKy9wcmludGluaXRpYWxlbnYKIC9wcm9mdG9vbAogL3JlbG9jYXRlLXJlbGEKIC9zcGxf
c2l6ZV9saW1pdApkaWZmIC0tZ2l0IGEvdG9vbHMvTWFrZWZpbGUgYi90b29scy9NYWtlZmlsZQpp
bmRleCAzNGExYWE3YThiNy4uYTNhZmRlZTc4MTMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL01ha2VmaWxl
CisrKyBiL3Rvb2xzL01ha2VmaWxlCkBAIC0yNDUsNiArMjQ1LDkgQEAgaG9zdHByb2dzLSQoQ09O
RklHX01JUFMpICs9IG1pcHMtcmVsb2NzCiBob3N0cHJvZ3MtJChDT05GSUdfQVNOMV9DT01QSUxF
UikJKz0gYXNuMV9jb21waWxlcgogSE9TVENGTEFHU19hc24xX2NvbXBpbGVyLm8gPSAtaWRpcmFm
dGVyICQoc3JjdHJlZSkvaW5jbHVkZQogCisjIGhvc3QgdG9vbCB0byBkdW1wIHRoZSBjdXJyZW50
bHkgY29uZmlndXJlZCBkZWZhdWx0IGVudmlyb25tZW50Citob3N0cHJvZ3MteQkJCQkrPSBwcmlu
dGluaXRpYWxlbnYKKwogSE9TVENGTEFHU19ta2VmaWNhcHN1bGUubyArPSBcCiAJJChzaGVsbCBw
a2ctY29uZmlnIC0tY2ZsYWdzIGdudXRscyAyPiAvZGV2L251bGwgfHwgZWNobyAiIikKIEhPU1RD
RkxBR1NfbWtlZmljYXBzdWxlLm8gKz0gXApkaWZmIC0tZ2l0IGEvdG9vbHMvcHJpbnRpbml0aWFs
ZW52LmMgYi90b29scy9wcmludGluaXRpYWxlbnYuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMC4uYzU4YjIzNGQ2NzkKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy9wcmlu
dGluaXRpYWxlbnYuYwpAQCAtMCwwICsxLDQ0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCsKKy8qCisgKiAoQykgQ29weXJpZ2h0IDIwMjIKKyAqIE1heCBLcnVtbWVuYWNo
ZXIsIFRvcmFkZXgKKyAqCisgKiBTbmlwcGV0cyB0YWtlbiBmcm9tIHRvb2xzL2Vudi9md19lbnYu
YworICoKKyAqIFRoaXMgcHJpbnRzIHRoZSBsaXN0IG9mIGRlZmF1bHQgZW52aXJvbm1lbnQgdmFy
aWFibGVzIGFzIGN1cnJlbnRseQorICogY29uZmlndXJlZC4KKyAqCisgKi8KKworI2luY2x1ZGUg
PHN0ZGlvLmg+CisKKy8qIFB1bGwgaW4gdGhlIGN1cnJlbnQgY29uZmlnIHRvIGRlZmluZSB0aGUg
ZGVmYXVsdCBlbnZpcm9ubWVudCAqLworI2luY2x1ZGUgPGxpbnV4L2tjb25maWcuaD4KKworI2lm
bmRlZiBfX0FTU0VNQkxZX18KKyNkZWZpbmUgX19BU1NFTUJMWV9fIC8qIGdldCBvbmx5ICNkZWZp
bmVzIGZyb20gY29uZmlnLmggKi8KKyNpbmNsdWRlIDxjb25maWcuaD4KKyN1bmRlZglfX0FTU0VN
QkxZX18KKyNlbHNlCisjaW5jbHVkZSA8Y29uZmlnLmg+CisjZW5kaWYKKworI2RlZmluZSBERUZB
VUxUX0VOVl9JTlNUQU5DRV9TVEFUSUMKKyNpbmNsdWRlIDxnZW5lcmF0ZWQvZW52aXJvbm1lbnQu
aD4KKyNpbmNsdWRlIDxlbnZfZGVmYXVsdC5oPgorCitpbnQgbWFpbih2b2lkKQoreworCWNoYXIg
KmVudiwgKm54dDsKKworCWZvciAoZW52ID0gZGVmYXVsdF9lbnZpcm9ubWVudDsgKmVudjsgZW52
ID0gbnh0ICsgMSkgeworCQlmb3IgKG54dCA9IGVudjsgKm54dDsgKytueHQpIHsKKwkJCWlmIChu
eHQgPj0gJmRlZmF1bHRfZW52aXJvbm1lbnRbc2l6ZW9mKGRlZmF1bHRfZW52aXJvbm1lbnQpXSkg
eworCQkJCWZwcmludGYoc3RkZXJyLCAiIyMgRXJyb3I6IGVudmlyb25tZW50IG5vdCB0ZXJtaW5h
dGVkXG4iKTsKKwkJCQlyZXR1cm4gLTE7CisJCQl9CisJCX0KKwkJcHJpbnRmKCIlc1xuIiwgZW52
KTsKKwl9CisJcmV0dXJuIDA7Cit9Ci0tIAoyLjM1LjMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
