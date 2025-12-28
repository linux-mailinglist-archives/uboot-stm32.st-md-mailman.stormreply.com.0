Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3B9CE51B7
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Dec 2025 16:09:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ED08C58D7B;
	Sun, 28 Dec 2025 15:09:01 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFE2DC5663A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Dec 2025 15:08:59 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-64b8b5410a1so9467071a12.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Dec 2025 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1766934539; x=1767539339;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QdV98Lh2V4nNh/XTX3QeAlqNVCxsCWIqkbJ2eJwv54w=;
 b=joSBBqe41nvFszFu/Q7b3a4BaMmsaetgBihJI2VEilvBXsDKi/pQobFewsYrJT63g9
 w4uGyslJ3r7fUTanFlpNSeXeexU7ILjj0NJ9HRKpkn0/sKsRfpPPMYg89GSosMBc5Y97
 tEJtIydRLrOqeOqFJdxphZAeGPo2yaGAZ7esE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766934539; x=1767539339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QdV98Lh2V4nNh/XTX3QeAlqNVCxsCWIqkbJ2eJwv54w=;
 b=bxNp/Ie0nDs9CMownu0OvznXH/QFNZ9kKJl3Dal8nZLn8Uo2tWTQl9dnT4gig3bnbe
 4aURfaWldF2C/WHF2wJD1Szbc2WkDfiirT9K8Gp2j7ZzD6xqrCeU7VxKowGDiVOZuq45
 e1VA4g2Cor+5mZRQ/bn8Gdt5/Xov6Y2SP7tw/VPlwpuuOUDbz5SHfGeVNAhJzzVV1/Lw
 CWRBW5DD+zvNI1LSyvwq/3mWd6/BHffkp18i4sV2gf7/Gz/IDDcas3K7zbKEEP/s+YEs
 pXqx2xUSici74V2J8XQUREgcewZAj6i0zhBXAmY8glXYSbaHzrFTKcKVT+V8V9rCoH9l
 U1ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEwS78bD+MNq06tJMCICaEDGhxdZiTGLc94I+KAwYsl9IgBOz3sIRtdak8Q6JA+qX1fQUJiwFCZtWqRA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9bkCsFk6AVoyUcohKgZK2dvJ0h9k77sRtExXvvBg9+elfmSmE
 ASpNqilGVCyp/3252LGmCbVcO/Z+o5bK69TxeeGXnByrlHCDqNsMtjCJgP4R+OxXMlE=
X-Gm-Gg: AY/fxX6cUTs1CiFPkdspVh6gOV2ohGDNSAJT4ctuocbaXAm3Gf4hpcuPUowmk7cqxi+
 MYew4UTBQJfCY8tzVMQ9jYKUvwxLkW2IIHnAstE0W6il0KlAg+30gazxXFOf3DdXZlCm5MhkPb9
 NtXSJNo4jcn5AFVWYfT5LCgWSSDUSsapXUl0XmDyqYbkDbTSyAJKo16WC20DnaAH3TTw6iowYdW
 u3tiHdXwKWC1tJ0XtKr5I15tZ6p7IKKOqKZC3JGSX/oadtkZM383QOmwjrUda/E7eh8NCiM/FIU
 Vek45ybKdHwOZzr+lw+0AHl5f8h7v8BaYcJFqaN56nDX3EJKNKQiD7MYQQnat5IcFImhsIMh+yN
 AdjWD1Ppq8TxOL3jTtoMiHsQ0rcBgSZ5NWRvwN/108tr6Ncyqt0WzHsFudeVuYwi1vcx9FAnCnY
 H351SYVFKTHDr0WjkTDdUC2kU44JB2hW7W8o0+6eDhOGZqvZOZ1E2KPrvtIlc1R/bcVz/UAC7zn
 8uCgw4GbSluioaF8WfILV8D6GvJ7CnEyRDbjYBjN8H2CNjUXAnoTaCROI8objj+oK/L+Tg7CcD3
 2TKJYCk4E4s=
X-Google-Smtp-Source: AGHT+IGjV6DdBS084zPfaxAWPJkz43g9d9O9YGxz5PyL/q4XmK2DvAuiV6z2Hr0YokkBe+f8uztY1w==
X-Received: by 2002:a05:6402:535b:20b0:64c:62f7:1ac4 with SMTP id
 4fb4d7f45d1cf-64c62f71cb9mr19426440a12.32.1766934538911; 
 Sun, 28 Dec 2025 07:08:58 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b91599844sm28835422a12.25.2025.12.28.07.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 07:08:58 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun, 28 Dec 2025 16:08:14 +0100
Message-ID: <20251228150844.24753-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH] board: stm32mp2: read boot index from backup
	register
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

Rm9sbG93aW5nIHRoZSBjb21taXQgOTViNWE3ZGUzMGY2ICjigJxGV1U6IFNUTTMyTVAxOiBBZGQg
c3VwcG9ydCB0byByZWFkCmJvb3QgaW5kZXggZnJvbSBiYWNrdXAgcmVnaXN0ZXLigJ0pLCB0aGlz
IHBhdGNoIGVuYWJsZXMgcmVhZGluZyB0aGUgYm9vdAppbmRleCBmcm9tIGJhY2t1cCByZWdpc3Rl
cnMgb24gU1RNMzJNUDIgcGxhdGZvcm1zLgoKU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkg
PGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgoKLS0tCgogYXJjaC9hcm0vbWFj
aC1zdG0zMm1wL2luY2x1ZGUvbWFjaC9zdG0zMi5oIHwgIDQgKysrKwogYm9hcmQvc3Qvc3RtMzJt
cDIvc3RtMzJtcDIuYyAgICAgICAgICAgICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9t
YWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3N0bTMyLmggYi9hcmNoL2FybS9tYWNoLXN0bTMybXAv
aW5jbHVkZS9tYWNoL3N0bTMyLmgKaW5kZXggMmJmNTBjNzU1Y2JkLi45MGYwNmEwNTJkM2YgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaAorKysg
Yi9hcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3N0bTMyLmgKQEAgLTE4OCw4ICsx
ODgsMTIgQEAgZW51bSBmb3JjZWRfYm9vdF9tb2RlIHsKIC8qIFRBTVAgcmVnaXN0ZXJzIHggPSAw
IHRvIDEyNyA6IGhhcmRjb2RlZCBkZXNjcmlwdGlvbiwgd2FpdGluZyBOVk1FTSBub2RlIGluIERU
ICovCiAjZGVmaW5lIFRBTVBfQkFDS1VQX1JFR0lTVEVSKHgpCQkoU1RNMzJfVEFNUF9CQVNFICsg
MHgxMDAgKyA0ICogKHgpKQogCisjZGVmaW5lIFRBTVBfRldVX0JPT1RfSU5GT19SRUcJCVRBTVBf
QkFDS1VQX1JFR0lTVEVSKDQ4KQogLyogVEFNUCByZWdpc3RlcnMgem9uZSAzIFJJRiAxIChSVykg
YXQgOTYqLwogI2RlZmluZSBUQU1QX0JPT1RfQ09OVEVYVAkJVEFNUF9CQUNLVVBfUkVHSVNURVIo
OTYpCisKKyNkZWZpbmUgVEFNUF9GV1VfQk9PVF9JRFhfTUFTSwkJR0VOTUFTSygzLCAwKQorI2Rl
ZmluZSBUQU1QX0ZXVV9CT09UX0lEWF9PRkZTRVQJMAogI2VuZGlmIC8qIGRlZmluZWQoQ09ORklH
X1NUTTMyTVAyM1gpIHx8IGRlZmluZWQoQ09ORklHX1NUTTMyTVAyNVgpICovCiAKIC8qIG9mZnNl
dCB1c2VkIGZvciBCU0VDIGRyaXZlcjogbWlzY19yZWFkIGFuZCBtaXNjX3dyaXRlICovCmRpZmYg
LS1naXQgYS9ib2FyZC9zdC9zdG0zMm1wMi9zdG0zMm1wMi5jIGIvYm9hcmQvc3Qvc3RtMzJtcDIv
c3RtMzJtcDIuYwppbmRleCBhNzIwNTZlMTJkNjMuLjEwMWYxYTQ5NDEwOCAxMDA2NDQKLS0tIGEv
Ym9hcmQvc3Qvc3RtMzJtcDIvc3RtMzJtcDIuYworKysgYi9ib2FyZC9zdC9zdG0zMm1wMi9zdG0z
Mm1wMi5jCkBAIC0yMjQsMyArMjI0LDI0IEBAIHZvaWQgYm9hcmRfcXVpZXNjZV9kZXZpY2VzKHZv
aWQpCiB7CiAJc2V0dXBfbGVkKExFRFNUX09GRik7CiB9CisKKyNpZiBkZWZpbmVkKENPTkZJR19G
V1VfTVVMVElfQkFOS19VUERBVEUpCisKKyNpbmNsdWRlIDxmd3UuaD4KKworLyoqCisgKiBmd3Vf
cGxhdF9nZXRfYm9vdGlkeCgpIC0gR2V0IHRoZSB2YWx1ZSBvZiB0aGUgYm9vdCBpbmRleAorICog
QGJvb3RfaWR4OiBCb290IGluZGV4IHZhbHVlCisgKgorICogR2V0IHRoZSB2YWx1ZSBvZiB0aGUg
YmFuayhwYXJ0aXRpb24pIGZyb20gd2hpY2ggdGhlIHBsYXRmb3JtCisgKiBoYXMgYm9vdGVkLiBU
aGlzIHZhbHVlIGlzIHBhc3NlZCB0byBVLUJvb3QgZnJvbSB0aGUgZWFybGllcgorICogc3RhZ2Ug
Ym9vdGxvYWRlciB3aGljaCBsb2FkcyBhbmQgYm9vdHMgYWxsIHRoZSByZWxldmFudAorICogZmly
bXdhcmUgaW1hZ2VzCisgKgorICovCit2b2lkIGZ3dV9wbGF0X2dldF9ib290aWR4KHVpbnQgKmJv
b3RfaWR4KQoreworCSpib290X2lkeCA9IChyZWFkbChUQU1QX0ZXVV9CT09UX0lORk9fUkVHKSA+
PgorCQkgICAgVEFNUF9GV1VfQk9PVF9JRFhfT0ZGU0VUKSAmIFRBTVBfRldVX0JPT1RfSURYX01B
U0s7Cit9CisjZW5kaWYgLyogQ09ORklHX0ZXVV9NVUxUSV9CQU5LX1VQREFURSAqLwotLSAKMi40
My4wCgpiYXNlLWNvbW1pdDogNTZjYWMyNTBiMDgzOWRkYmFkMTMxMWQzY2E0MjMxZjUzMmI1YWFk
ZgpicmFuY2g6IHN0bTMybXAyLWFjdGl2ZS1pbmRleApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
