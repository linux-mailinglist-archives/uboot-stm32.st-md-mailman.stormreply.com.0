Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7405ACE9C
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Sep 2022 11:16:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5E79C0C920;
	Mon,  5 Sep 2022 09:16:17 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BA98C0AA15
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 09:16:17 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id cu2so15870071ejb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 02:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Kqt+rW3VfN7V1YzCvAdDyzFtpJ3gle8Yax/KRZ5T28M=;
 b=qlOzDLlhgB+VDuh6dEoZSphwqU6Cj7HncNk7BQ8Lq3uoOTifVHt++jP1K9Ear7Y+TU
 nPlKpzUjrT+NyUcu+4qhnxFoKkCGiYPbsGudw0nKWLOOrIh1ccGoaRpvbJx2WAvv8Zrh
 PSlI29UpEdf0CcvirkOo5bsu43GDCpqd+J950h382yC//jR2nPAVNfDHjCLE1Lk8/BrX
 7ClMblmwQoFIKvDQIL5R+6Y4XeD5u4PoYh7pIW9dsRYq2A9/SRzjhelD4Ey3A60Tudpa
 Q89wKmrpf2cS9jU8iIYQApXWkLZCbu5AUuKToRBCn/sbC1T8lYT7OB44Q1dfhMWouN/L
 gFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Kqt+rW3VfN7V1YzCvAdDyzFtpJ3gle8Yax/KRZ5T28M=;
 b=Sg4ao0HPCnjU435ikGmSYuuVrhkV4jxdqclRK7Wq2L1Gh+7foot0vb6X2bfQngspIw
 F3XJDYN3TnDrGiZeBZlSzoIamkWAMtLC9hTm4SIpFlYb0K6w9O6lXb0yMBCOGd38MmiC
 qZpwp3xkhPgaqf/hGUmI5ewftt6s5bMe2mEU3prbHs3KFurIqkMFEOaaOZBkMHNBLVVj
 OQuJFV+hMzLsI7J9UoebaVs6IZJguu9TTB2qfospntUunZp72qlF6xLdAOgsjRqWwiRf
 yW/Y+9C5x/WFM/lYDnuw8i/CoHsQ5HgBiVAnopsdb1HyrWS4104OJZIYfg7IXcL5xVLF
 HelA==
X-Gm-Message-State: ACgBeo3qOVitI8DzPKi+kUFlTtm02kp94zwydU24O6AEHkyVrQuv24Ds
 EZpns/sy3fbyJLa2rDCuxGDsrXIasuogjZOp
X-Google-Smtp-Source: AA6agR6yQ4RK4S2iIrkAvQy81Nec9aC7rz2V7IrrDwBT7OiwAOtZQzhurJgYPGfNfRaglJL50wVg2Q==
X-Received: by 2002:a17:907:97d3:b0:73d:8b9b:a6c1 with SMTP id
 js19-20020a17090797d300b0073d8b9ba6c1mr35092365ejc.71.1662369376746; 
 Mon, 05 Sep 2022 02:16:16 -0700 (PDT)
Received: from lmecxl1178.lme.st.com
 ([2a04:cec0:104a:337b:3027:a7a3:40f7:5678])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a056402231500b00445f2dc2901sm6096030eda.21.2022.09.05.02.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 02:16:16 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: u-boot@lists.denx.de
Date: Mon,  5 Sep 2022 11:15:28 +0200
Message-Id: <20220905091528.579610-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32mp15: remove hwlocks from
	pinctrl
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

UmVtb3ZlcyBod2xvY2tzIHByb3BlcnRpZXMgZnJvbSBzdG0zMm1wMTUxIHBpbmN0cmwgbm9kZS4g
VGhlc2UgbG9ja3MKY291bGQgYmUgdXNlZCBmb3Igb3RoZXIgcHVycG9zZSwgZGVwZW5kaW5nIG9u
IGJvYXJkIGFuZCBzb2Z0d2FyZQpjb25maWd1cmF0aW9uIGhlbmNlIGRvIG5vdCBlbmZvcmNlIHRo
ZWlyIHVzZSB0byBwcm90ZWN0IHBpbmN0cmwKZGV2aWNlcy4KClRoaXMgcGF0Y2ggaXMgYW4gYWxp
Z25tZW50IHdpdGggTGludXggZGV2aWNlIHRyZWUgd2l0aCB2Ni4wIGFzIHRoZQpod3NlbSBzdXBw
b3J0IHdhc27igJl0IHlldCBhZGRlZCBpbiBwaW5jb250cm9sIGluIGtlcm5lbC4gSXQgYXZvaWRz
Cmlzc3VlcyB3aGVuIHRoZSBMaW51eCBrZXJuZWwgaXMgc3RhcnRlZCB3aXRoIHRoZSBVLUJvb3Qg
ZGV2aWNlIHRyZWUuCgpDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5z
dC5jb20+CkNjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29t
PgpTaWduZWQtb2ZmLWJ5OiBFdGllbm5lIENhcnJpZXJlIDxldGllbm5lLmNhcnJpZXJlQGxpbmFy
by5vcmc+Ci0tLQogYXJjaC9hcm0vZHRzL3N0bTMybXAxNTEuZHRzaSB8IDIgLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1w
MTUxLmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1MS5kdHNpCmluZGV4IGE1YWM2MmM4M2Qu
Ljc2N2EwNmVmNjggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTUxLmR0c2kKKysr
IGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTEuZHRzaQpAQCAtMTY2Myw3ICsxNjYzLDYgQEAKIAkJ
CXJhbmdlcyA9IDwwIDB4NTAwMDIwMDAgMHhhNDAwPjsKIAkJCWludGVycnVwdC1wYXJlbnQgPSA8
JmV4dGk+OwogCQkJc3Qsc3lzY2ZnID0gPCZleHRpIDB4NjAgMHhmZj47Ci0JCQlod2xvY2tzID0g
PCZod3NwaW5sb2NrIDA+OwogCQkJcGlucy1hcmUtbnVtYmVyZWQ7CiAKIAkJCWdwaW9hOiBncGlv
QDUwMDAyMDAwIHsKQEAgLTE3OTYsNyArMTc5NSw2IEBACiAJCQlwaW5zLWFyZS1udW1iZXJlZDsK
IAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+OwogCQkJc3Qsc3lzY2ZnID0gPCZleHRpIDB4
NjAgMHhmZj47Ci0JCQlod2xvY2tzID0gPCZod3NwaW5sb2NrIDA+OwogCiAJCQlncGlvejogZ3Bp
b0A1NDAwNDAwMCB7CiAJCQkJZ3Bpby1jb250cm9sbGVyOwotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
