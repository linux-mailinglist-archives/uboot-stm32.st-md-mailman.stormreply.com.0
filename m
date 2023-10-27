Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 015AF7D9BAE
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Oct 2023 16:40:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC073C6C85C;
	Fri, 27 Oct 2023 14:40:35 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 923BDC6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 14:40:33 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39RCM5sg027647; Fri, 27 Oct 2023 16:40:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=
 selector1; bh=6p8FTeM2ez8HeUURj3sCJfU5SgZbBUz7IK+Xapt/RFM=; b=fJ
 AQGQ4+Mh9Pz/84PcSsecVHpDPLe5RFs8qC7JPyeybnzOQePV+IhfmNLC2sXyhCe1
 jzcqvZVJrxsTEAyX9OrXeSiEbryCwQ+PE2ncLd/EjE070H+kAjkAwgEymsiyiJt4
 XUxS46vnuOaKK6WtA2baSBS99zwu1KF2ABpVPIQaSPs2oy6jY/ej6XAW5J4orhn6
 K+3pL5bYn42FLZl9OyUvYyPSauFvSKtS8GXBt9FUa63WzwFwA557U7uXIeNNtv0U
 p6kyYTUk1X93HoG/uxciZg489KWMIznyl59DzAEtn8GClJ07ddbxPUsBOItt8SK/
 xLwFRiiQVXuGRxOgBE9A==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tywqqm902-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:40:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B34DC100066;
 Fri, 27 Oct 2023 16:40:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC382245530;
 Fri, 27 Oct 2023 16:40:29 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 27 Oct
 2023 16:40:29 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Oct 2023 16:39:54 +0200
Message-ID: <20231027144002.1001881-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027144002.1001881-1-patrice.chotard@foss.st.com>
References: <20231027144002.1001881-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_13,2023-10-27_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 1/9] arm: caches: Make
	DCACHE_DEFAULT_OPTION accessible for ARM64 arch
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

VGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIGNvbXBpbGF0aW9uIGVycm9yIGluIEFSTTY0OgphcmNo
L2FybS9tYWNoLXN0bTMybXAvZHJhbV9pbml0LmM6IEluIGZ1bmN0aW9uIOKAmGJvYXJkX2dldF91
c2FibGVfcmFtX3RvcOKAmToKYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1faW5pdC5jOjU5OjQ1
OiBlcnJvcjog4oCYRENBQ0hFX0RFRkFVTFRfT1BUSU9O4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVz
ZSBpbiB0aGlzIGZ1bmN0aW9uKQogICA1OSB8ICBtbXVfc2V0X3JlZ2lvbl9kY2FjaGVfYmVoYXZp
b3VyKHJlZywgc2l6ZSwgRENBQ0hFX0RFRkFVTFRfT1BUSU9OKTsKICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgoK
U2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5j
b20+Ci0tLQoKIGFyY2gvYXJtL2luY2x1ZGUvYXNtL3N5c3RlbS5oIHwgMTYgKysrKysrKystLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9zeXN0ZW0uaCBiL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL3N5c3RlbS5oCmluZGV4IDBlYWU4NTdlNzNhLi40M2Y3NTAzNTcxZCAxMDA2NDQKLS0t
IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vc3lzdGVtLmgKKysrIGIvYXJjaC9hcm0vaW5jbHVkZS9h
c20vc3lzdGVtLmgKQEAgLTUxMywxNCArNTEzLDYgQEAgZW51bSBkY2FjaGVfb3B0aW9uIHsKIH07
CiAjZW5kaWYKIAotI2lmIGRlZmluZWQoQ09ORklHX1NZU19BUk1fQ0FDSEVfV1JJVEVUSFJPVUdI
KQotI2RlZmluZSBEQ0FDSEVfREVGQVVMVF9PUFRJT04JRENBQ0hFX1dSSVRFVEhST1VHSAotI2Vs
aWYgZGVmaW5lZChDT05GSUdfU1lTX0FSTV9DQUNIRV9XUklURUFMTE9DKQotI2RlZmluZSBEQ0FD
SEVfREVGQVVMVF9PUFRJT04JRENBQ0hFX1dSSVRFQUxMT0MKLSNlbGlmIGRlZmluZWQoQ09ORklH
X1NZU19BUk1fQ0FDSEVfV1JJVEVCQUNLKQotI2RlZmluZSBEQ0FDSEVfREVGQVVMVF9PUFRJT04J
RENBQ0hFX1dSSVRFQkFDSwotI2VuZGlmCi0KIC8qIFNpemUgb2YgYW4gTU1VIHNlY3Rpb24gKi8K
IGVudW0gewogI2lmZGVmIENPTkZJR19BUk1WN19MUEFFCkBAIC01NzgsNiArNTcwLDE0IEBAIHZv
aWQgcHNjaV9zeXN0ZW1fcmVzZXQodm9pZCk7CiAKICNlbmRpZiAvKiBDT05GSUdfQVJNNjQgKi8K
IAorI2lmIGRlZmluZWQoQ09ORklHX1NZU19BUk1fQ0FDSEVfV1JJVEVUSFJPVUdIKQorI2RlZmlu
ZSBEQ0FDSEVfREVGQVVMVF9PUFRJT04JRENBQ0hFX1dSSVRFVEhST1VHSAorI2VsaWYgZGVmaW5l
ZChDT05GSUdfU1lTX0FSTV9DQUNIRV9XUklURUFMTE9DKQorI2RlZmluZSBEQ0FDSEVfREVGQVVM
VF9PUFRJT04JRENBQ0hFX1dSSVRFQUxMT0MKKyNlbGlmIGRlZmluZWQoQ09ORklHX1NZU19BUk1f
Q0FDSEVfV1JJVEVCQUNLKQorI2RlZmluZSBEQ0FDSEVfREVGQVVMVF9PUFRJT04JRENBQ0hFX1dS
SVRFQkFDSworI2VuZGlmCisKICNpZm5kZWYgX19BU1NFTUJMWV9fCiAvKioKICAqIHNhdmVfYm9v
dF9wYXJhbXMoKSAtIFNhdmUgYm9vdCBwYXJhbWV0ZXJzIGJlZm9yZSBzdGFydGluZyByZXNldCBz
ZXF1ZW5jZQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
