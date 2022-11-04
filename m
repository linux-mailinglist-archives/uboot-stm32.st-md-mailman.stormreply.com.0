Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4426619671
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Nov 2022 13:46:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B208C65042;
	Fri,  4 Nov 2022 12:46:00 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92ECBC65040
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 12:45:58 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id a67so7395171edf.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Nov 2022 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ZxRixcDXoK+ZZjQFG0LKgdMO+0+q28kq8UXiJY4cHk=;
 b=Zp3JPkAt+LtlpxLygyvKVxnqllgLkmbSYjBdbANte+cgkgpQkVajoQRXH7wsdIHdYW
 WSTI7Vd36SIxJBGx6RN7CW3RnWdjV0ol8iibFJBhLzm8BuWiSSLVPVAv1wZaroNzvKVR
 pMcH3OR/5YKlrUT5P4t2+qPTj9y8WSMuhXRUXdkAAKxonb2J+JOJQoIrBGehi5fdw0qo
 MtHfFagJS5UMo+nLhUsY577ZSEbAm9MKRzqJ2b87OMoV39pWI54dps2Tgj/a+dCQtvQi
 yqIHE22HC+TXXmrWVx5Oef9d6uz/bkYrk5tU+InC365QatPBt26YhCHN2KZAPpyvS4l8
 JFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ZxRixcDXoK+ZZjQFG0LKgdMO+0+q28kq8UXiJY4cHk=;
 b=FCwcP4oY8JLk1CGcMOOaa9ZqoM9zoNUzqQ9Jr5j/j5kPicGi8v6ksUBZ7VZYUzWO+J
 EMZqSCAuuwhSSuWh5Vop27Up7S6UKK3i1/ahzLZiqr3UjwSGg/hA0U+Gwz/BtAxIC72J
 Drr10lQ5GNjX+A6gN/lcWJtRJ/t2UksMIjmK+OnqQmTN6b7rv7LsiAIyHKobAtWgvHr2
 JtVxRQfYloggjrdPHNld23fEtz2aCElKoT3Q/n0TA7FF6uSU7ft6w8t12ha+mpCPTBGk
 0YlYfuRirZq+Y1uu7KL7djawfGBL25n9TP67E1kKc0fk4FAf832x51zm3cJrEerxzMi1
 Dz9A==
X-Gm-Message-State: ACrzQf1BbMpg0WNiTHqBVnswKHTeP4Gv8MW1nmoc0q4Iw9Wh0oqTbgoB
 5nQ2pIiqrxLo0UxEeWK9noA=
X-Google-Smtp-Source: AMsMyM7M53o0kPzpdOuFxs2TkO2+gRP/joGd/45YfRTlivii7Nkt2nkQEi8asM4KA3PJrZn3HemtLg==
X-Received: by 2002:a05:6402:1cc5:b0:453:ed3f:6a38 with SMTP id
 ds5-20020a0564021cc500b00453ed3f6a38mr35847735edb.346.1667565958147; 
 Fri, 04 Nov 2022 05:45:58 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 t26-20020aa7db1a000000b0045ce419ecffsm1898105eds.58.2022.11.04.05.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 05:45:57 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: u-boot@lists.denx.de
Date: Fri,  4 Nov 2022 13:44:57 +0100
Message-Id: <20221104124458.890133-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221104124458.890133-1-max.oss.09@gmail.com>
References: <20221104124458.890133-1-max.oss.09@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v3 1/1] Makefile: rework u-boot-initial-env
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
Y2hlckB0b3JhZGV4LmNvbT4KCi0tLQoKQ2hhbmdlcyBpbiB2MzoKLSBtb3ZlZCB0aGUgdG9vbCBm
cm9tIHNjcmlwdHMvIHRvIHRvb2xzLy4gU3VnZ2VzdGVkIGJ5IFRvbSBSaW5pCi0gY2hhbmdlZCB0
aGUgZGVwZW5kZW5jaWVzIHRvICckKGVudl9oKScgYW5kICd0b29scycuCiAgU3VnZ2VzdGVkIGJ5
IFRvbSBSaW5pIGFuZCBQYWxpIFJvaMOhci4KLSByZW1vdmVkIHRoZSBzZWQgcnVsZSB3aGljaCBy
ZXBsYWNlcyBceDAwIHdpdGggXHgwQSBhcyB0aGlzIGlzIGFscmVhZHkKICBkb25lIGJ5IHRoZSB0
b29sLiBTdWdnZXN0ZWQgYnkgUGFsaSBSb2jDoXIuCgpDaGFuZ2VzIGluIHYyOgotIHJld29ya2Vk
IHRvIGJ1aWxkIGEgaG9zdCB0b29sIHdoaWNoIHByaW50cyB0aGUgY29uZmlndXJlZAogIGVudmly
b25tZW50IGFzIHByb3Bvc2VkIGJ5IFBhbGkgUm9ow6FyCiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvdS1ib290LzIwMjIxMDE4MTc0ODI3LjEzOTMyMTEtMS1tYXgub3NzLjA5QGdtYWlsLmNvbS8K
LSByZW5hbWVkIHBhdGNoLCB2MSB1c2VkICJNYWtlZmlsZTogZml4IHUtYm9vdC1pbml0aWFsLWVu
diB0YXJnZXQgaWYgbHRvIGlzIGVuYWJsZWQiCgogTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAg
OSArKysrKy0tLS0KIHRvb2xzLy5naXRpZ25vcmUgICAgICAgIHwgIDEgKwogdG9vbHMvTWFrZWZp
bGUgICAgICAgICAgfCAgMyArKysKIHRvb2xzL3ByaW50aW5pdGlhbGVudi5jIHwgNDQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNTMg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9w
cmludGluaXRpYWxlbnYuYwoKZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXgg
MGYxMTc0NzE4ZjcuLmI4ZWUyZGViM2VjIDEwMDY0NAotLS0gYS9NYWtlZmlsZQorKysgYi9NYWtl
ZmlsZQpAQCAtMjQ0MiwxMSArMjQ0MiwxMiBAQCBlbmRpZgogCSQoUSkkKE1BS0UpIC1mICQoc3Jj
dHJlZSkvc2NyaXB0cy9NYWtlZmlsZS5tb2Rwb3N0CiAKIHF1aWV0X2NtZF9nZW5lbnYgPSBHRU5F
TlYgICRACi1jbWRfZ2VuZW52ID0gJChPQkpDT1BZKSAtLWR1bXAtc2VjdGlvbiAucm9kYXRhLmRl
ZmF1bHRfZW52aXJvbm1lbnQ9JEAgZW52L2NvbW1vbi5vOyBcCi0Jc2VkIC0taW4tcGxhY2UgLWUg
J3MvXHgwMC9ceDBBL2cnICRAOyBzZWQgLS1pbi1wbGFjZSAtZSAnL15ccyokJC9kJyAkQDsgXAot
CXNvcnQgLS1maWVsZC1zZXBhcmF0b3I9PSAtazEsMSAtLXN0YWJsZSAkQCAtbyAkQAorY21kX2dl
bmVudiA9IFwKKwl0b29scy9wcmludGluaXRpYWxlbnYgfCBcCisJc2VkIC1lICcvXlxzKiQkL2Qn
IHwgXAorCXNvcnQgLS1maWVsZC1zZXBhcmF0b3I9PSAtazEsMSAtLXN0YWJsZSAtbyAkQAogCi11
LWJvb3QtaW5pdGlhbC1lbnY6IHUtYm9vdC5iaW4KK3UtYm9vdC1pbml0aWFsLWVudjogJChlbnZf
aCkgdG9vbHMgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZCxnZW5lbnYpCiAKICMgQ29uc2lzdGVu
Y3kgY2hlY2tzCmRpZmYgLS1naXQgYS90b29scy8uZ2l0aWdub3JlIGIvdG9vbHMvLmdpdGlnbm9y
ZQppbmRleCBkM2E5M2ZmMjk0YS4uMjhlOGNlMmEwN2EgMTAwNjQ0Ci0tLSBhL3Rvb2xzLy5naXRp
Z25vcmUKKysrIGIvdG9vbHMvLmdpdGlnbm9yZQpAQCAtMjgsNiArMjgsNyBAQAogL214c2Jvb3QK
IC9uY2IKIC9wcmVsaW5rLXJpc2N2CisvcHJpbnRpbml0aWFsZW52CiAvcHJvZnRvb2wKIC9yZWxv
Y2F0ZS1yZWxhCiAvc3BsX3NpemVfbGltaXQKZGlmZiAtLWdpdCBhL3Rvb2xzL01ha2VmaWxlIGIv
dG9vbHMvTWFrZWZpbGUKaW5kZXggMzRhMWFhN2E4YjcuLmEzYWZkZWU3ODEzIDEwMDY0NAotLS0g
YS90b29scy9NYWtlZmlsZQorKysgYi90b29scy9NYWtlZmlsZQpAQCAtMjQ1LDYgKzI0NSw5IEBA
IGhvc3Rwcm9ncy0kKENPTkZJR19NSVBTKSArPSBtaXBzLXJlbG9jcwogaG9zdHByb2dzLSQoQ09O
RklHX0FTTjFfQ09NUElMRVIpCSs9IGFzbjFfY29tcGlsZXIKIEhPU1RDRkxBR1NfYXNuMV9jb21w
aWxlci5vID0gLWlkaXJhZnRlciAkKHNyY3RyZWUpL2luY2x1ZGUKIAorIyBob3N0IHRvb2wgdG8g
ZHVtcCB0aGUgY3VycmVudGx5IGNvbmZpZ3VyZWQgZGVmYXVsdCBlbnZpcm9ubWVudAoraG9zdHBy
b2dzLXkJCQkJKz0gcHJpbnRpbml0aWFsZW52CisKIEhPU1RDRkxBR1NfbWtlZmljYXBzdWxlLm8g
Kz0gXAogCSQoc2hlbGwgcGtnLWNvbmZpZyAtLWNmbGFncyBnbnV0bHMgMj4gL2Rldi9udWxsIHx8
IGVjaG8gIiIpCiBIT1NUQ0ZMQUdTX21rZWZpY2Fwc3VsZS5vICs9IFwKZGlmZiAtLWdpdCBhL3Rv
b2xzL3ByaW50aW5pdGlhbGVudi5jIGIvdG9vbHMvcHJpbnRpbml0aWFsZW52LmMKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAuLmM1OGIyMzRkNjc5Ci0tLSAvZGV2L251bGwK
KysrIGIvdG9vbHMvcHJpbnRpbml0aWFsZW52LmMKQEAgLTAsMCArMSw0NCBAQAorLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArCisvKgorICogKEMpIENvcHlyaWdodCAyMDIyCisg
KiBNYXggS3J1bW1lbmFjaGVyLCBUb3JhZGV4CisgKgorICogU25pcHBldHMgdGFrZW4gZnJvbSB0
b29scy9lbnYvZndfZW52LmMKKyAqCisgKiBUaGlzIHByaW50cyB0aGUgbGlzdCBvZiBkZWZhdWx0
IGVudmlyb25tZW50IHZhcmlhYmxlcyBhcyBjdXJyZW50bHkKKyAqIGNvbmZpZ3VyZWQuCisgKgor
ICovCisKKyNpbmNsdWRlIDxzdGRpby5oPgorCisvKiBQdWxsIGluIHRoZSBjdXJyZW50IGNvbmZp
ZyB0byBkZWZpbmUgdGhlIGRlZmF1bHQgZW52aXJvbm1lbnQgKi8KKyNpbmNsdWRlIDxsaW51eC9r
Y29uZmlnLmg+CisKKyNpZm5kZWYgX19BU1NFTUJMWV9fCisjZGVmaW5lIF9fQVNTRU1CTFlfXyAv
KiBnZXQgb25seSAjZGVmaW5lcyBmcm9tIGNvbmZpZy5oICovCisjaW5jbHVkZSA8Y29uZmlnLmg+
CisjdW5kZWYJX19BU1NFTUJMWV9fCisjZWxzZQorI2luY2x1ZGUgPGNvbmZpZy5oPgorI2VuZGlm
CisKKyNkZWZpbmUgREVGQVVMVF9FTlZfSU5TVEFOQ0VfU1RBVElDCisjaW5jbHVkZSA8Z2VuZXJh
dGVkL2Vudmlyb25tZW50Lmg+CisjaW5jbHVkZSA8ZW52X2RlZmF1bHQuaD4KKworaW50IG1haW4o
dm9pZCkKK3sKKwljaGFyICplbnYsICpueHQ7CisKKwlmb3IgKGVudiA9IGRlZmF1bHRfZW52aXJv
bm1lbnQ7ICplbnY7IGVudiA9IG54dCArIDEpIHsKKwkJZm9yIChueHQgPSBlbnY7ICpueHQ7ICsr
bnh0KSB7CisJCQlpZiAobnh0ID49ICZkZWZhdWx0X2Vudmlyb25tZW50W3NpemVvZihkZWZhdWx0
X2Vudmlyb25tZW50KV0pIHsKKwkJCQlmcHJpbnRmKHN0ZGVyciwgIiMjIEVycm9yOiBlbnZpcm9u
bWVudCBub3QgdGVybWluYXRlZFxuIik7CisJCQkJcmV0dXJuIC0xOworCQkJfQorCQl9CisJCXBy
aW50ZigiJXNcbiIsIGVudik7CisJfQorCXJldHVybiAwOworfQotLSAKMi4zNS4zCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
