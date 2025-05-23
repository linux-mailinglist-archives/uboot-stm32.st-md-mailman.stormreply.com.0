Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D0AC2021
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 May 2025 11:48:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF70EC7A832;
	Fri, 23 May 2025 09:48:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE19EC7A823
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 09:48:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N826LP016426;
 Fri, 23 May 2025 11:48:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ls8dx3XqZjziXW6N70aAJw18VFM1Q/6VdCHNig5QGd8=; b=CX06iDRis8WEqXc1
 Kdav3CA6+3tS3L/tjBNI6R1oBsYUV2G8kiAyHS1RTh+0d6XK3MwWuVJ7B17AqzTM
 /FssbTh4VO6i8s+Y7MZPaEUR3/mpcgHGsQWYl37VVTsGZJJsZiYeJETiAhg7owXc
 5Qtb2cDfS9c3GtqcCvqXOqs7VuWCVpdfCaUj1dSj3gPcO9E2P/oRcE9V29KPCAGO
 KUXUH5BiuglRtHoiJAZxJkM8FyvbklMQVayq4jDPUtNd7HiGPRRFY7lEn1AY0gDG
 nwxPraIBVSo6WoOIqNQ/hN5cguBGcc1JBl0cYWzkLYxs5sh/70ziaR1fRqJTYjVc
 +t+/9Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfqw6yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 11:48:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C82EC40050;
 Fri, 23 May 2025 11:47:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B072ADC0CD;
 Fri, 23 May 2025 11:47:13 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 11:47:12 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: <u-boot@lists.denx.de>, Stefan Roese <sr@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 23 May 2025 11:46:57 +0200
Message-ID: <20250523094658.299730-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521122755.265760-1-antonio.borneo@foss.st.com>
References: <20250521122755.265760-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 3/4] watchdog: stm32mp: check the watchdog
	status
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

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
QWRkIGEgbWVhbiB0byBjaGVjayB0aGUgSVdERyBzdGF0dXMgYmFzZWQgb24gdGhlIHBlcmlwaGVy
YWwgdmVyc2lvbi4KVGhpcyBpcyBkb25lIGJ5IGVpdGhlciBjaGVja2luZyB0aGUgc3RhdHVzIGJp
dCBPTkYgZWl0aGVyIGJ5IHVwZGF0aW5nCnRoZSByZWxvYWQgcmVnaXN0ZXIgd2l0aCB0aGUgc2Ft
ZSB2YWx1ZSBhbmQgY2hlY2sgaWYgdGhlIHJlbG9hZCBzdWNjZWVkLgoKU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9AZm9zcy5zdC5jb20+Ci0tLQog
ZHJpdmVycy93YXRjaGRvZy9zdG0zMm1wX3dkdC5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJtcF93ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cvc3Rt
MzJtcF93ZHQuYwppbmRleCA5N2FiOGNmZTdhYi4uMDcxMjUyNGI0YTggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvd2F0Y2hkb2cvc3RtMzJtcF93ZHQuYworKysgYi9kcml2ZXJzL3dhdGNoZG9nL3N0bTMy
bXBfd2R0LmMKQEAgLTIxLDExICsyMSwxMyBAQAogI2RlZmluZSBJV0RHX1BSCQkweDA0CS8qIFBy
ZXNjYWxlciBSZWdpc3RlciAqLwogI2RlZmluZSBJV0RHX1JMUgkweDA4CS8qIFJlTG9hZCBSZWdp
c3RlciAqLwogI2RlZmluZSBJV0RHX1NSCQkweDBDCS8qIFN0YXR1cyBSZWdpc3RlciAqLworI2Rl
ZmluZSBJV0RHX1ZFUlIJMHgzRjQJLyogVmVyc2lvbiBSZWdpc3RlciAqLwogCiAvKiBJV0RHX0tS
IHJlZ2lzdGVyIGJpdCBtYXNrICovCiAjZGVmaW5lIEtSX0tFWV9SRUxPQUQJMHhBQUFBCS8qIFJl
bG9hZCBjb3VudGVyIGVuYWJsZSAqLwogI2RlZmluZSBLUl9LRVlfRU5BQkxFCTB4Q0NDQwkvKiBQ
ZXJpcGhlcmFsIGVuYWJsZSAqLwogI2RlZmluZSBLUl9LRVlfRVdBCTB4NTU1NQkvKiBXcml0ZSBh
Y2Nlc3MgZW5hYmxlICovCisjZGVmaW5lIEtSX0tFWV9EV0EJMHgwMDAwCS8qIFdyaXRlIGFjY2Vz
cyBkaXNhYmxlKi8KIAogLyogSVdER19QUiByZWdpc3RlciBiaXQgdmFsdWVzICovCiAjZGVmaW5l
IFBSXzI1NgkJMHgwNgkvKiBQcmVzY2FsZXIgc2V0IHRvIDI1NiAqLwpAQCAtMzYsMTAgKzM4LDE3
IEBACiAvKiBJV0RHX1NSIHJlZ2lzdGVyIGJpdCB2YWx1ZXMgKi8KICNkZWZpbmUgU1JfUFZVCQlC
SVQoMCkJLyogV2F0Y2hkb2cgcHJlc2NhbGVyIHZhbHVlIHVwZGF0ZSAqLwogI2RlZmluZSBTUl9S
VlUJCUJJVCgxKQkvKiBXYXRjaGRvZyBjb3VudGVyIHJlbG9hZCB2YWx1ZSB1cGRhdGUgKi8KKyNk
ZWZpbmUgU1JfT05GCQlCSVQoOCkJLyogV2F0Y2hkb2cgZW5hYmxlIHN0YXR1cyBiaXQgKi8KKwor
LyogSVdERyBDb21wYXRpYmlsaXR5ICovCisjZGVmaW5lIE9ORl9NSU5fVkVSCTB4MzEKKworI2Rl
ZmluZSBUSU1FT1VUX1VTCTEwMDAwCiAKIHN0cnVjdCBzdG0zMm1wX3dkdF9wcml2IHsKIAlmZHRf
YWRkcl90IGJhc2U7CQkvKiByZWdpc3RlcnMgYWRkciBpbiBwaHlzaWNhbCBtZW1vcnkgKi8KIAl1
bnNpZ25lZCBsb25nIHdkdF9jbGtfcmF0ZTsJLyogV2F0Y2hkb2cgZGVkaWNhdGVkIGNsb2NrIHJh
dGUgKi8KKwl1bnNpZ25lZCBpbnQgaHdfdmVyc2lvbjsJLyogUGVyaXBoZXJhbCB2ZXJzaW9uICov
CiB9OwogCiBzdGF0aWMgaW50IHN0bTMybXBfd2R0X3Jlc2V0KHN0cnVjdCB1ZGV2aWNlICpkZXYp
CkBAIC05MCw2ICs5OSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJtcF93ZHRfc3RhcnQoc3RydWN0IHVk
ZXZpY2UgKmRldiwgdTY0IHRpbWVvdXRfbXMsIHVsb25nIGZsYWdzKQogc3RhdGljIGludCBzdG0z
Mm1wX3dkdF9wcm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KQogewogCXN0cnVjdCBzdG0zMm1wX3dk
dF9wcml2ICpwcml2ID0gZGV2X2dldF9wcml2KGRldik7CisJdTMyIHJsciwgc3I7CiAJc3RydWN0
IGNsayBjbGs7CiAJaW50IHJldDsKIApAQCAtMTE1LDYgKzEyNSwyOSBAQCBzdGF0aWMgaW50IHN0
bTMybXBfd2R0X3Byb2JlKHN0cnVjdCB1ZGV2aWNlICpkZXYpCiAKIAlwcml2LT53ZHRfY2xrX3Jh
dGUgPSBjbGtfZ2V0X3JhdGUoJmNsayk7CiAKKwlwcml2LT5od192ZXJzaW9uID0gcmVhZGwocHJp
di0+YmFzZSArIElXREdfVkVSUik7CisKKwlpZiAocHJpdi0+aHdfdmVyc2lvbiA+PSBPTkZfTUlO
X1ZFUikgeworCQlpZiAocmVhZGwocHJpdi0+YmFzZSArIElXREdfU1IpICYgU1JfT05GKQorCQkJ
d2R0X3NldF9mb3JjZV9hdXRvc3RhcnQoZGV2KTsKKwl9IGVsc2UgeworCQkvKgorCQkgKiBXb3Jr
YXJvdW5kIGZvciBvbGQgdmVyc2lvbnMgd2l0aG91dCBJV0RHX1NSX09ORiBiaXQ6CisJCSAqIC0g
d3JpdGUgaW4gSVdER19STFJfT0ZGU0VUCisJCSAqIC0gd2FpdCBmb3Igc3luYworCQkgKiAtIGlm
IHN5bmMgc3VjY2VlZHMsIHRoZW4gaXdkZyBpcyBydW5uaW5nCisJCSAqLworCQl3cml0ZWwoS1Jf
S0VZX0VXQSwgcHJpdi0+YmFzZSArIElXREdfS1IpOworCQlybHIgPSByZWFkbChwcml2LT5iYXNl
ICsgSVdER19STFIpOworCQl3cml0ZWwocmxyLCBwcml2LT5iYXNlICsgSVdER19STFIpOworCQly
ZXQgPSByZWFkbF9wb2xsX3RpbWVvdXQocHJpdi0+YmFzZSArIElXREdfU1IsIHNyLCBzciAmIFNS
X1JWVSwKKwkJCQkJIFRJTUVPVVRfVVMpOworCQlpZiAoIXJldCkKKwkJCXdkdF9zZXRfZm9yY2Vf
YXV0b3N0YXJ0KGRldik7CisKKwkJd3JpdGVsKEtSX0tFWV9EV0EsIHByaXYtPmJhc2UgKyBJV0RH
X0tSKTsKKwl9CisKIAlkZXZfZGJnKGRldiwgIklXREcgaW5pdCBkb25lXG4iKTsKIAogCXJldHVy
biAwOwotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
