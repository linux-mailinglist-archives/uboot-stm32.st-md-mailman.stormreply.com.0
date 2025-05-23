Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13075AC201E
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 May 2025 11:48:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5C0DC7A82B;
	Fri, 23 May 2025 09:48:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0915C7A823
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 09:48:04 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N826KS024909;
 Fri, 23 May 2025 11:48:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 J5zTpSUWmnmvaB+ebeoyiNcmeSkixkYVC82YamZI3h8=; b=L0+yBEOGQKxSiIr/
 gHZwBI+TXExcWKQZHzNDjPcDhHpSzdd2J/4R4+ow30TjttP8iXOEegzK+Org22hC
 vK0d6xiBtFTyE/mJ1b9yPSuHPaBNVhbYu08ZIXbSBHeG8kXIpqC8dM4+u060eWCX
 232kxqWufy5AvgAjOjLbmOmdA51GQBNVYdTq8lRFFqgEKMX+IkgfR3WW+xWjX0el
 y27WvrD0KRzJkOWBlZO3lcvVxHxPTU38me+xzVQw/fNOY6i8zriiUZx7p+7vZs1+
 g8ljdsvP3b1iDWb/DYcYqFVm/vlbZLSjIinhOCCA+Djg6ADs2p4+nY/PzD6Mt369
 6bSgNw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfanecg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 11:48:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CA4944004C;
 Fri, 23 May 2025 11:47:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 679FBAD36F6;
 Fri, 23 May 2025 11:47:11 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 11:47:11 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: <u-boot@lists.denx.de>, Stefan Roese <sr@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 23 May 2025 11:46:54 +0200
Message-ID: <20250523094658.299730-1-antonio.borneo@foss.st.com>
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
Subject: [Uboot-stm32] [PATCH v2 0/4] watchdog for STM32MP family
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
b2YgdGhlIHdhdGNoZG9nIHNldCBieSBhIHByZXZpb3VzIGJvb3Qgc3RhZ2UuCkZvciBiYWNrd2Fy
ZCBjb21wYXRpYmlsaXR5IG9uIHBsYXRmb3JtcyB1c2luZyBTUEwsIHN0aWxsIGxldApVLUJvb3Qg
dG8gYXV0b3N0YXJ0IHRoZSB3YXRjaGRvZy4KClYxID09PiBWMgotIEZpeCBiYWNrd2FyZCBjb21w
YXRpYmlsaXR5IG9uIGRlZmNvbmZpZyBiYXNlZCBvbiBTUEwKLSBGaXggaW5jb25zaXN0ZW5jeSBp
biB0aGUgY29tbWl0IG1lc3NhZ2UKLSBSZWJhc2Ugb24gY3VycmVudCBicmFuY2ggbmV4dAoKQW50
b25pbyBCb3JuZW8gKDIpOgogIHdhdGNoZG9nOiB3ZHQtdWNsYXNzLmM6IGFkZCB3ZHRfc2V0X2Zv
cmNlX2F1dG9zdGFydCgpIGhlbHBlcgogIHdhdGNoZG9nOiBhcm1fc21jX3dkdDogZ2V0IHdkdCBz
dGF0dXMgdGhyb3VnaCBTTUNXRF9HRVRfVElNRUxFRlQKCkNsw6ltZW50IExlIEdvZmZpYyAoMSk6
CiAgd2F0Y2hkb2c6IHN0bTMybXA6IGNoZWNrIHRoZSB3YXRjaGRvZyBzdGF0dXMKClBhdHJpY2Ug
Q2hvdGFyZCAoMSk6CiAgd2F0Y2hkb2c6IGRvbid0IGF1dG9zdGFydCB3YXRjaGRvZyBvbiBTVE0z
Mk1QIGFyY2hpdGVjdHVyZQoKIC4uLnN0bTMybXAxNS1pY29yZS1zdG0zMm1wMS1jdG91Y2gyX2Rl
ZmNvbmZpZyB8ICAxICsKIC4uLnRtMzJtcDE1LWljb3JlLXN0bTMybXAxLWVkaW1tMi4yX2RlZmNv
bmZpZyB8ICAxICsKIC4uLi1taWNyb2dlYS1zdG0zMm1wMS1taWNyb2RldjItb2Y3X2RlZmNvbmZp
ZyB8ICAxICsKIC4uLm1wMTUtbWljcm9nZWEtc3RtMzJtcDEtbWljcm9kZXYyX2RlZmNvbmZpZyB8
ICAxICsKIGNvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZyAgICAgICAgICAgICB8ICAx
ICsKIGNvbmZpZ3Mvc3RtMzJtcDE1X2Roc29tLmNvbmZpZyAgICAgICAgICAgICAgICB8ICAxICsK
IGRyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIGRy
aXZlcnMvd2F0Y2hkb2cvYXJtX3NtY193ZHQuYyAgICAgICAgICAgICAgICB8IDE3ICsrKysrKysr
KysKIGRyaXZlcnMvd2F0Y2hkb2cvc3RtMzJtcF93ZHQuYyAgICAgICAgICAgICAgICB8IDMzICsr
KysrKysrKysrKysrKysrKysKIGRyaXZlcnMvd2F0Y2hkb2cvd2R0LXVjbGFzcy5jICAgICAgICAg
ICAgICAgICB8ICA5ICsrKysrCiBpbmNsdWRlL3dkdC5oICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgOSArKysrKwogMTEgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKQoK
CmJhc2UtY29tbWl0OiBlZjMwNWNlZmY5Yzg3NWE3YzE2ZmRmZmM1ZTEyMGQ4ZGRmNjI0M2I3Ci0t
IAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3Vib290LXN0bTMyCg==
