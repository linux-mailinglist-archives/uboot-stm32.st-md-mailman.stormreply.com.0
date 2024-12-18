Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5AE9F63A7
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:45:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39BE7C78027;
	Wed, 18 Dec 2024 10:45:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A631C78012
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:45:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI60L0C011674;
 Wed, 18 Dec 2024 11:45:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 EdaZhDCZuY7B75Dc5Rrta6PCTTK1rOCUcwYCYZlaRw0=; b=eo/Bh6nmTIjBUnhq
 CCsgzYu1Xbt8r1YOad+HO6EzF7+gfFVvIiY8oDP0B5ztksHBtY9J41vYsqD9dcBf
 35K4yoM3EcjAMXpg82KBlI3hdc847s8hd2TwodQ4Qk/So93nZVk+roLRyVeDo6e5
 hD9VK+riJtiBym+ec+vGrzFHU7zSo2xW0EO24W1rHQ2CarCvBEz27AScN/7RwS8v
 /jN4nYsejIcZc/nDaGvHVk6ZfXCZ8i1VjrYnV1u3N7zTNrrhTXSQUpwdL1GB85kL
 IX2pnFhPaxca48POHnQKUXjO8wjyjG8ueDF0dnXMKgU4SFnM+USyQQSDUIBZ7HBH
 X6SoQQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43krrcs54s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:45:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4183D40055;
 Wed, 18 Dec 2024 11:44:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB57125E1E4;
 Wed, 18 Dec 2024 11:43:17 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 11:43:17 +0100
Message-ID: <f18f23e0-383d-4e13-b6d3-357668d48e49@foss.st.com>
Date: Wed, 18 Dec 2024 11:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241216102219.347725-1-patrice.chotard@foss.st.com>
 <20241216102219.347725-2-patrice.chotard@foss.st.com>
 <895daee1-23bc-4c37-8d81-5de08153cf4c@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <895daee1-23bc-4c37-8d81-5de08153cf4c@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/5] configs: stm32mp1: Restore boot SPL
 from sdcard for Engicam i.Core STM32MP1 C.TOUCH 2.0
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

CgpPbiAxMi8xOC8yNCAxMDowNCwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biAxMi8xNi8yNCAxMToyMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBSZXN0b3JlIGJvb3Qg
U1BMIGZyb20gc2RjYXJkIGZvciBFbmdpY2FtIGkuQ29yZSBTVE0zMk1QMSBDLlRPVUNIIDIuMC4K
Pj4KPj4gRml4ZXM6IDJhMDBkNzNkMDgxYSAoInNwbDogbW1jOiBUcnkgdG8gY2xlYW4gdXAgcmF3
LW1vZGUgb3B0aW9ucyIpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgY29uZmlncy9zdG0zMm1w
MTUtaWNvcmUtc3RtMzJtcDEtY3RvdWNoMl9kZWZjb25maWcgfCAzICsrKwo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMy
bXAxNS1pY29yZS1zdG0zMm1wMS1jdG91Y2gyX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3RtMzJtcDE1
LWljb3JlLXN0bTMybXAxLWN0b3VjaDJfZGVmY29uZmlnCj4+IGluZGV4IDRlMTcxMjAwZWYyLi4w
MGM0NzUzMDdjOSAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9zdG0zMm1wMTUtaWNvcmUtc3RtMzJt
cDEtY3RvdWNoMl9kZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9zdG0zMm1wMTUtaWNvcmUtc3Rt
MzJtcDEtY3RvdWNoMl9kZWZjb25maWcKPj4gQEAgLTI3LDYgKzI3LDkgQEAgQ09ORklHX1NQTF9T
WVNfTUFMTE9DPXkKPj4gwqAgQ09ORklHX1NQTF9IQVNfQ1VTVE9NX01BTExPQ19TVEFSVD15Cj4+
IMKgIENPTkZJR19TUExfQ1VTVE9NX1NZU19NQUxMT0NfQUREUj0weGMwMzAwMDAwCj4+IMKgIENP
TkZJR19TUExfU1lTX01BTExPQ19TSVpFPTB4MWQwMDAwMAo+PiArQ09ORklHX1NQTF9TWVNfTU1D
U0RfUkFXX01PREU9eQo+PiArQ09ORklHX1NZU19NTUNTRF9SQVdfTU9ERV9VX0JPT1RfVVNFX1BB
UlRJVElPTj15Cj4+ICtDT05GSUdfU1lTX01NQ1NEX1JBV19NT0RFX1VfQk9PVF9QQVJUSVRJT049
MHgzCj4+IMKgIENPTkZJR19TUExfRU5WX1NVUFBPUlQ9eQo+PiDCoCBDT05GSUdfU1BMX0kyQz15
Cj4+IMKgIENPTkZJR19TUExfUE9XRVI9eQo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERl
bGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJp
Y2sKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MKUGF0cmljZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
