Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8DED3974C
	for <lists+uboot-stm32@lfdr.de>; Sun, 18 Jan 2026 15:56:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFC81C555BE;
	Sun, 18 Jan 2026 14:55:59 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95723C36B12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Jan 2026 14:55:58 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b872de50c91so543409166b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Jan 2026 06:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768748158; x=1769352958;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VVPjRYAdNTUCCylsfyHSbISrRELr4ncnQIVEfeEPAic=;
 b=nRu10Qc2HIDRW+7x3maWVcWJ40rXjtW5sYjwCY6J90GyzfX4WOUHOYbnW2PIDLUHj/
 bD0JQS4zUydXcmoia5tZB6RIJdXXPjxqJtiOCj8cbhLa4WndpOPgnbjBti9beIBzTweC
 8EY1J/TBVfDMTqIGbl+9NjuBEsgLWHsV4T/ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768748158; x=1769352958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VVPjRYAdNTUCCylsfyHSbISrRELr4ncnQIVEfeEPAic=;
 b=Hxy227WBEd/r2MBiObOAGmAFXsN8sMMrEYgTsEQRVlWJl5jSISouirNIv7HWjwVqSb
 +frr1IfjPsqNRhQH9iZ6Bo7LtQI3vSM7fsmLI2GukoMStV727S/CuFvFQuxUb7Qunpdy
 ayeBqVXydHuI5yuG0KE9DiTjQwurESimoQnjDhwwtguQ8QlEh0RyJhHOJL2DSFB6qtBd
 TSMRUnn/eXm2BbFzWdxFBHrNmoV9Nt5XIt3KqnjADYLBdwCvLUkbR45MSTYzsrlG3Cts
 9fvDJhj7mu4iXkGH6kOCJj8k6YocCBPoWvsvCZrGUH2Fzzh+DB85MJV657iqdKyLrEtI
 bWfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSHyhKREEDEfN2HiaLJcihtXeyebRAd4moi6WkbhOISvQPtaikX1v56zGun/pqSfQ/EYV52FTXtVtUXA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz6dQZncFI/k4YpWXQLn2wCbulRkVZybvUZR0VrqPSGu9LQv6y9
 CjTQx3c1FQ4AY6dek5orQoLNUR46zPeb+x/u5WaSQt1cIjVKaCpJfbAjE0SS6/GNvKI=
X-Gm-Gg: AY/fxX7GJikrbVZqy6RiyURET4D/FD//fpNf7w/MyKCIJkDZ+8k6qO+EP5M+su0lz7k
 9k68b9feuX28L7nCQtsI9FAUw6eHlEI04ngyUgdtGgykFLYWQBoqNvEZBmWAAMnVKE+Vk8svQQu
 W3b4xaRQKEVEOaf70EcbaTL/hQEF0dkt7clvAWBE21qNjAO1O3t7Oqc8C9wAUpJSMDSoeKZObf+
 xg14owZfd1omsmXGofmhT+XE8upT3skJMBvUE4SuUIepk232aM68Q6nZDW2mkZJuFOPL5Fj/29k
 rGJ4ecJ+rWUYLJ8ZN+h9PotoZxgSqQ0POqcT4C1ejkk1fo0NpseenyrSHs7b3sZtQXdK0E95o1H
 dGWmBwEKgCiUN2cfJn/9SX+QQhLhhZnjFZFfAR1aYnWDT4IWnKjZUiohLBAIjFMXEfdfk99M0Ma
 PEzO5tB4ykBoXYHRPsxM+mhGKXBhYy4pB1kE+WkQfpjKJXyAZnBfy6uCE5SMpIFFiYS8yMYmgwX
 5+ksNEHPJh2YqOY2T7o7DPTI/WP/KJTyRhpQumAqal+BtaL4mEN2bQTFSBWL6r8jjvewKyBhJOm
 871chehTCwc=
X-Received: by 2002:a17:907:3f8a:b0:b87:7e8:e287 with SMTP id
 a640c23a62f3a-b87930086d4mr661659366b.30.1768748157653; 
 Sun, 18 Jan 2026 06:55:57 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795a31322sm854760166b.63.2026.01.18.06.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 06:55:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun, 18 Jan 2026 11:48:43 +0100
Message-ID: <20260118104912.1672642-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RESEND PATCH] board: stm32mp2: read boot index from
	backup register
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
c3RtMzJtcDIuYwppbmRleCA3YmM3ZDJhNjA4ZmQuLjQzYmM1ODMzNzhlNiAxMDA2NDQKLS0tIGEv
Ym9hcmQvc3Qvc3RtMzJtcDIvc3RtMzJtcDIuYworKysgYi9ib2FyZC9zdC9zdG0zMm1wMi9zdG0z
Mm1wMi5jCkBAIC0xODgsMyArMTg4LDI0IEBAIHZvaWQgYm9hcmRfcXVpZXNjZV9kZXZpY2VzKHZv
aWQpCiB7CiAJbGVkX2Jvb3Rfb2ZmKCk7CiB9CisKKyNpZiBkZWZpbmVkKENPTkZJR19GV1VfTVVM
VElfQkFOS19VUERBVEUpCisKKyNpbmNsdWRlIDxmd3UuaD4KKworLyoqCisgKiBmd3VfcGxhdF9n
ZXRfYm9vdGlkeCgpIC0gR2V0IHRoZSB2YWx1ZSBvZiB0aGUgYm9vdCBpbmRleAorICogQGJvb3Rf
aWR4OiBCb290IGluZGV4IHZhbHVlCisgKgorICogR2V0IHRoZSB2YWx1ZSBvZiB0aGUgYmFuayhw
YXJ0aXRpb24pIGZyb20gd2hpY2ggdGhlIHBsYXRmb3JtCisgKiBoYXMgYm9vdGVkLiBUaGlzIHZh
bHVlIGlzIHBhc3NlZCB0byBVLUJvb3QgZnJvbSB0aGUgZWFybGllcgorICogc3RhZ2UgYm9vdGxv
YWRlciB3aGljaCBsb2FkcyBhbmQgYm9vdHMgYWxsIHRoZSByZWxldmFudAorICogZmlybXdhcmUg
aW1hZ2VzCisgKgorICovCit2b2lkIGZ3dV9wbGF0X2dldF9ib290aWR4KHVpbnQgKmJvb3RfaWR4
KQoreworCSpib290X2lkeCA9IChyZWFkbChUQU1QX0ZXVV9CT09UX0lORk9fUkVHKSA+PgorCQkg
ICAgVEFNUF9GV1VfQk9PVF9JRFhfT0ZGU0VUKSAmIFRBTVBfRldVX0JPT1RfSURYX01BU0s7Cit9
CisjZW5kaWYgLyogQ09ORklHX0ZXVV9NVUxUSV9CQU5LX1VQREFURSAqLwotLSAKMi40My4wCgpi
YXNlLWNvbW1pdDogZmY0OThhM2M1ZWZiNDI0YWNjYzFkODI1Y2M0NWNlZGUyNTQwY2ExMwpicmFu
Y2g6IHN0bTMybXAyLWFjdGl2ZS1pbmRleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
