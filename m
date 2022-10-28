Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0ED611769
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Oct 2022 18:20:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85FDBC640F5;
	Fri, 28 Oct 2022 16:20:24 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F044C640F9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 16:20:23 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id b2so14112405eja.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 09:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9jQov0U3K0h5xYE0c6Q7wOYslz3K5OHQFZ2gqKyHUJI=;
 b=Cd8OO6V8bJ6ScLZ7GZl5LH9E+A/EGnxaTrewOKaxAhbH1gK/HuI6Ot+/StqjAlUWYD
 WFL64lau5OtwdkXnfmU53jPEH6sWFJ/6sYNf9OOTj5xXAB5e/O1vM1t1EsHWhfyChWVR
 HRTA5w3DR2LU/iNZ90DUCM5ChmrkJ3NTiNztR1yXrZ/fXanM8QJOYuIePOGpn7MA1WiX
 7hzU8vImohE2i6GWtJvolUzY7w+lgCctcsbT6juz7kWfViv9R+4oyTg85Eu4F9RPw7S+
 0TST5dtc4ueQpxrWyij+G3sSN4//TScT1sKeHxttGrC3tBYYsXaRryF6NwwfZ5VHESxo
 FS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9jQov0U3K0h5xYE0c6Q7wOYslz3K5OHQFZ2gqKyHUJI=;
 b=CpjBp8relGf4cPXOZKpmANIeuc+szp9q0nbgD3wnf7mj+aLLOm8j+tMWsCGKb0F0In
 El5of8jebgV1SEJbKa8P/dSHaIhR5LNv86XeVd0r30eGUoU8DJAWVGY6LmjLTACET9Wr
 jNYgjm4YFLzsUtzfqG9RWzVMPn4WIB7QpnEdojxrELNoaP4p9jlgb6AClD8ZB8KFHbk8
 f3OEo/90kPZj6xS9RwzlsFFu3Yqu+drPfcD0a90eWVDZpWeDNTMeZOI8SDFYqRUTumsv
 iciSgUZP0ferMPXWc7DpzRYVVnn8XwvAp5kPawDkycY7hfPXXibAnoj8KK4Px7QuCpdi
 tTfw==
X-Gm-Message-State: ACrzQf3ArAct868RLBZzy1qjUg0F27/12ML+18ElltjV8n7O0fdAYslY
 KpawxnBz3PYGym2Uxrr8FcQ=
X-Google-Smtp-Source: AMsMyM5FMSRkNVquwkqRQGPIGA0Z2gX5qkhxJu6ffUG5yqhs3dVLUJsuwXN5x1PURHTjQOMp6mZrgQ==
X-Received: by 2002:a17:907:9807:b0:797:a5ba:1327 with SMTP id
 ji7-20020a170907980700b00797a5ba1327mr145848ejc.274.1666974022717; 
 Fri, 28 Oct 2022 09:20:22 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 le5-20020a170907170500b00781e7d364ebsm2458478ejc.144.2022.10.28.09.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:20:22 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: u-boot@lists.denx.de
Date: Fri, 28 Oct 2022 18:18:49 +0200
Message-Id: <20221028161850.565610-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221028161850.565610-1-max.oss.09@gmail.com>
References: <20221028161850.565610-1-max.oss.09@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v2 1/1] Makefile: rework u-boot-initial-env
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
Y2hlckB0b3JhZGV4LmNvbT4KCi0tLQoKQ2hhbmdlcyBpbiB2MjoKLSByZXdvcmtlZCB0byBidWls
ZCBhIGhvc3QgdG9vbCB3aGljaCBwcmludHMgdGhlIGNvbmZpZ3VyZWQKICBlbnZpcm9ubWVudCBh
cyBwcm9wb3NlZCBieSBQYWxpIFJvaMOhcgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3UtYm9v
dC8yMDIyMTAxODE3NDgyNy4xMzkzMjExLTEtbWF4Lm9zcy4wOUBnbWFpbC5jb20vCi0gcmVuYW1l
ZCBwYXRjaCwgdjEgdXNlZCAiTWFrZWZpbGU6IGZpeCB1LWJvb3QtaW5pdGlhbC1lbnYgdGFyZ2V0
IGlmIGx0byBpcyBlbmFibGVkIgoKIE1ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgNyArKysr
LS0tCiBzY3JpcHRzLy5naXRpZ25vcmUgICAgICAgIHwgIDEgKwogc2NyaXB0cy9NYWtlZmlsZSAg
ICAgICAgICB8ICA1ICsrKysrCiBzY3JpcHRzL3ByaW50aW5pdGlhbGVudi5jIHwgNDQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDU0IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9w
cmludGluaXRpYWxlbnYuYwoKZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXgg
MGYxMTc0NzE4ZjcuLjJmOTdkNjNjMzk4IDEwMDY0NAotLS0gYS9NYWtlZmlsZQorKysgYi9NYWtl
ZmlsZQpAQCAtMjQ0Miw5ICsyNDQyLDEwIEBAIGVuZGlmCiAJJChRKSQoTUFLRSkgLWYgJChzcmN0
cmVlKS9zY3JpcHRzL01ha2VmaWxlLm1vZHBvc3QKIAogcXVpZXRfY21kX2dlbmVudiA9IEdFTkVO
ViAgJEAKLWNtZF9nZW5lbnYgPSAkKE9CSkNPUFkpIC0tZHVtcC1zZWN0aW9uIC5yb2RhdGEuZGVm
YXVsdF9lbnZpcm9ubWVudD0kQCBlbnYvY29tbW9uLm87IFwKLQlzZWQgLS1pbi1wbGFjZSAtZSAn
cy9ceDAwL1x4MEEvZycgJEA7IHNlZCAtLWluLXBsYWNlIC1lICcvXlxzKiQkL2QnICRAOyBcCi0J
c29ydCAtLWZpZWxkLXNlcGFyYXRvcj09IC1rMSwxIC0tc3RhYmxlICRAIC1vICRACitjbWRfZ2Vu
ZW52ID0gXAorCXNjcmlwdHMvcHJpbnRpbml0aWFsZW52IHwgXAorCXNlZCAtZSAncy9ceDAwL1x4
MEEvZycgLWUgJy9eXHMqJCQvZCcgfCBcCisJc29ydCAtLWZpZWxkLXNlcGFyYXRvcj09IC1rMSwx
IC0tc3RhYmxlIC1vICRACiAKIHUtYm9vdC1pbml0aWFsLWVudjogdS1ib290LmJpbgogCSQoY2Fs
bCBpZl9jaGFuZ2VkLGdlbmVudikKZGlmZiAtLWdpdCBhL3NjcmlwdHMvLmdpdGlnbm9yZSBiL3Nj
cmlwdHMvLmdpdGlnbm9yZQppbmRleCAwOGNjODI0YmFjMy4uNjA2ODcyNGEwZDQgMTAwNjQ0Ci0t
LSBhL3NjcmlwdHMvLmdpdGlnbm9yZQorKysgYi9zY3JpcHRzLy5naXRpZ25vcmUKQEAgLTIsMyAr
Miw0IEBACiAjIEdlbmVyYXRlZCBmaWxlcwogIwogYmluMmMKK3ByaW50aW5pdGlhbGVudgpkaWZm
IC0tZ2l0IGEvc2NyaXB0cy9NYWtlZmlsZSBiL3NjcmlwdHMvTWFrZWZpbGUKaW5kZXggODczMWU2
Y2VjZDcuLmJhOTkzODIwNTcxIDEwMDY0NAotLS0gYS9zY3JpcHRzL01ha2VmaWxlCisrKyBiL3Nj
cmlwdHMvTWFrZWZpbGUKQEAgLTUsOCArNSwxMyBAQAogIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIAog
aG9zdHByb2dzLSQoQ09ORklHX0JVSUxEX0JJTjJDKQkJKz0gYmluMmMKK2hvc3Rwcm9ncy15CQkJ
CSs9IHByaW50aW5pdGlhbGVudgogCiBhbHdheXMJCTo9ICQoaG9zdHByb2dzLXkpCiAKK0hPU1RD
RkxBR1NfcHJpbnRpbml0aWFsZW52Lm8gKz0gXAorCQkkKHBhdHN1YnN0IC1JJSwtaWRpcmFmdGVy
JSwgJChmaWx0ZXIgLUklLCAkKFVCT09USU5DTFVERSkpKSBcCisJCS1EVVNFX0hPU1RDQworCiAj
IExldCBjbGVhbiBkZXNjZW5kIGludG8gc3ViZGlycwogc3ViZGlyLQkrPSBiYXNpYyBrY29uZmln
IGR0YwpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9wcmludGluaXRpYWxlbnYuYyBiL3NjcmlwdHMvcHJp
bnRpbml0aWFsZW52LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAuLmM1
OGIyMzRkNjc5Ci0tLSAvZGV2L251bGwKKysrIGIvc2NyaXB0cy9wcmludGluaXRpYWxlbnYuYwpA
QCAtMCwwICsxLDQ0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsKKy8q
CisgKiAoQykgQ29weXJpZ2h0IDIwMjIKKyAqIE1heCBLcnVtbWVuYWNoZXIsIFRvcmFkZXgKKyAq
CisgKiBTbmlwcGV0cyB0YWtlbiBmcm9tIHRvb2xzL2Vudi9md19lbnYuYworICoKKyAqIFRoaXMg
cHJpbnRzIHRoZSBsaXN0IG9mIGRlZmF1bHQgZW52aXJvbm1lbnQgdmFyaWFibGVzIGFzIGN1cnJl
bnRseQorICogY29uZmlndXJlZC4KKyAqCisgKi8KKworI2luY2x1ZGUgPHN0ZGlvLmg+CisKKy8q
IFB1bGwgaW4gdGhlIGN1cnJlbnQgY29uZmlnIHRvIGRlZmluZSB0aGUgZGVmYXVsdCBlbnZpcm9u
bWVudCAqLworI2luY2x1ZGUgPGxpbnV4L2tjb25maWcuaD4KKworI2lmbmRlZiBfX0FTU0VNQkxZ
X18KKyNkZWZpbmUgX19BU1NFTUJMWV9fIC8qIGdldCBvbmx5ICNkZWZpbmVzIGZyb20gY29uZmln
LmggKi8KKyNpbmNsdWRlIDxjb25maWcuaD4KKyN1bmRlZglfX0FTU0VNQkxZX18KKyNlbHNlCisj
aW5jbHVkZSA8Y29uZmlnLmg+CisjZW5kaWYKKworI2RlZmluZSBERUZBVUxUX0VOVl9JTlNUQU5D
RV9TVEFUSUMKKyNpbmNsdWRlIDxnZW5lcmF0ZWQvZW52aXJvbm1lbnQuaD4KKyNpbmNsdWRlIDxl
bnZfZGVmYXVsdC5oPgorCitpbnQgbWFpbih2b2lkKQoreworCWNoYXIgKmVudiwgKm54dDsKKwor
CWZvciAoZW52ID0gZGVmYXVsdF9lbnZpcm9ubWVudDsgKmVudjsgZW52ID0gbnh0ICsgMSkgewor
CQlmb3IgKG54dCA9IGVudjsgKm54dDsgKytueHQpIHsKKwkJCWlmIChueHQgPj0gJmRlZmF1bHRf
ZW52aXJvbm1lbnRbc2l6ZW9mKGRlZmF1bHRfZW52aXJvbm1lbnQpXSkgeworCQkJCWZwcmludGYo
c3RkZXJyLCAiIyMgRXJyb3I6IGVudmlyb25tZW50IG5vdCB0ZXJtaW5hdGVkXG4iKTsKKwkJCQly
ZXR1cm4gLTE7CisJCQl9CisJCX0KKwkJcHJpbnRmKCIlc1xuIiwgZW52KTsKKwl9CisJcmV0dXJu
IDA7Cit9Ci0tIAoyLjM1LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
