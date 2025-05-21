Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0445FABF928
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 17:24:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EC0EC7A82D;
	Wed, 21 May 2025 15:24:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60ED7C78F97
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 12:29:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LC0f19017098;
 Wed, 21 May 2025 14:29:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=W7/zcALgui6R9BdBkaPxe3
 ZPckl7A/FufUkxvtoZ+Sw=; b=f0925c1YaKQG5n5Kkvn9cgFsOh09PutlWsFS78
 o3CTHmSFn5qXD2KpZ5QWocn4/IuIyDC55qrLcEy5pkj886uMdww9BVv4AmZwn4IL
 0wXP3emT0EUnjmEfcnVgVwR+jYZmCP40jn0fCYyUZwWLrV+8RZr5vt2U3IGZUM9p
 M/ZEve/2E5ZZsjCk7qAn9dOHrlEdeIgmA16JNZ1DRpCE/cSxjXHUngtcw7sPk5Ef
 7XYdFL7KfaqI8sZArQVX9Om82kSw8jZQw/ZOvMHVjvfYtK+HnTy4LmCa/RgC3N3k
 DdxY+TMtGeO/D1FJBoqzim73mKOTQz8yOGVX/DqnEcKIgmmQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfc3wjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 14:29:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 11FAB40049;
 Wed, 21 May 2025 14:28:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C2EFBDE792;
 Wed, 21 May 2025 14:28:09 +0200 (CEST)
Received: from localhost (10.252.16.84) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 14:28:08 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: <u-boot@lists.denx.de>, Stefan Roese <sr@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 21 May 2025 14:27:51 +0200
Message-ID: <20250521122755.265760-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.252.16.84]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Mailman-Approved-At: Wed, 21 May 2025 15:24:50 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/4] watchdog for STM32MP family
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

VGhpcyBzZXJpZXMgYWRkcmVzc2VzIHRoZSB0d28gd2F0Y2hkb2cgZHJpdmVycyB1c2VkIG9uIFNU
TTMyTVB4eApmYW1pbHkgcGxhdGZvcm1zLgoKT24gdGhlIGdlbmVyaWMgd2F0Y2hkb2cgZnJhbWV3
b3JrLCBpdCBhZGRzIGEgbmV3IG1ldGhvZAp3ZHRfc2V0X2ZvcmNlX2F1dG9zdGFydCgpIHVzZWQg
YnkgdGhlIHdhdGNoZG9nIGRyaXZlcnMgdG8gZm9yY2UKdGhlIGF1dG9zdGFydCBzdGF0dXMgb2Yg
dGhlIHdhdGNoZG9nLgpUaGlzIGlzIHVzZWQgd2hlbiB0aGUgZHJpdmVyIGRldGVjdHMgdGhhdCB0
aGUgd2F0Y2hkb2cgaGFzIGFscmVhZHkKYmVlbiBzdGFydGVkIGJ5IGEgcHJldmlvdXMgYm9vdCBz
dGFnZSAoZS5nLiBIVywgYm9vdHJvbSwgU2VjdXJlCk9TLCAuLi4pIGFuZCBuZWVkcyB0byBiZSBr
aWNrZWQgYnkgVS1Cb290IHJlZ2FyZGxlc3Mgb2YgdGhlCmF1dG9zdGFydCBmbGFnIHNldCBpbiBE
VCBvciBpbiBjb25maWcuCgpPbiB0aGUgZHJpdmVyIGFybV9zbWNfd2R0LCBpdCBhZGRzIHRoZSBB
UEkgdG8gcXVlcnkgdGhlIFNlY3VyZSBPUwphYm91dCB0aGUgc3RhdGUgb2YgdGhlIHdhdGNoZG9n
LCBhbmQgaWYgYXQgcHJvYmUgdGhlIHdhdGNoZG9nIGlzCmFscmVhZHkgc3RhcnRlZCBpdCBpbnZv
a2VzIHdkdF9zZXRfZm9yY2VfYXV0b3N0YXJ0KCkuCgpPbiB0aGUgZHJpdmVyIHN0bTMybXBfd2R0
LCBpdCBhZGRzIHRoZSBjb2RlIHRvIGRldGVjdCB0aGUgc3RhdGUgb2YKdGhlIHdhdGNoZG9nLCBh
bmQgaWYgYXQgcHJvYmUgdGhlIHdhdGNoZG9nIGlzIGFscmVhZHkgc3RhcnRlZCBpdAppbnZva2Vz
IHdkdF9zZXRfZm9yY2VfYXV0b3N0YXJ0KCkuCgpBdCBsYXN0LCBzaW5jZSBhbGwgdGhlIHdhdGNo
ZG9nIGRyaXZlcnMgdXNlZCBvbiBTVE0zMk1QeHggZmFtaWx5CnBsYXRmb3JtcyBjYW4gcXVlcnkg
dGhlIHN0YXR1cyBvZiB0aGUgd2F0Y2hkb2cgYW5kIHVzZSBpdApjb25zZXF1ZW50bHksIHNldCBX
QVRDSERPR19BVVRPU1RBUlQgZGVmYXVsdCB0byAnbicgb24gc3VjaApwbGF0Zm9ybXMuIFRoaXMg
aW1wbGllcyB0aGF0IFUtQm9vdCwgYnkgZGVmYXVsdCwgd2lsbCByZXNwZWN0IHRoZQpzdGF0dXMg
b2YgdGhlIHdhdGNoZG9nIHNldCBieSBhIHByZXZpb3VzIGJvb3Qgc3RhZ2UuCgoKQW50b25pbyBC
b3JuZW8gKDIpOgogIHdhdGNoZG9nOiB3ZHQtdWNsYXNzLmM6IGFkZCB3ZHRfc2V0X2ZvcmNlX2F1
dG9zdGFydCgpIGhlbHBlcgogIHdhdGNoZG9nOiBhcm1fc21jX3dkdDogZ2V0IHdkdCBzdGF0dXMg
dGhyb3VnaCBTTUNXRF9HRVRfVElNRUxFRlQKCkNsw6ltZW50IExlIEdvZmZpYyAoMSk6CiAgd2F0
Y2hkb2c6IHN0bTMybXA6IGNoZWNrIHRoZSB3YXRjaGRvZyBzdGF0dXMKClBhdHJpY2UgQ2hvdGFy
ZCAoMSk6CiAgd2F0Y2hkb2c6IGRvbid0IGF1dG9zdGFydCB3YXRjaGRvZyBvbiBTVE0zMk1QIGJv
YXJkcwoKIGRyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZyAgICAgICB8ICAxICsKIGRyaXZlcnMvd2F0
Y2hkb2cvYXJtX3NtY193ZHQuYyB8IDE3ICsrKysrKysrKysrKysrKysrCiBkcml2ZXJzL3dhdGNo
ZG9nL3N0bTMybXBfd2R0LmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IGRyaXZlcnMvd2F0Y2hkb2cvd2R0LXVjbGFzcy5jICB8ICA5ICsrKysrKysrKwogaW5jbHVkZS93
ZHQuaCAgICAgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDY5
IGluc2VydGlvbnMoKykKCgpiYXNlLWNvbW1pdDogMGJjOWIyODhmYWIzZDlkMTQzMDY2ZGI3MTI5
OWE0YzA0N2JlMzhiOQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
