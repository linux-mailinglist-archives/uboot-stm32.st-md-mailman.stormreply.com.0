Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D913AA94A9
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 May 2025 15:37:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4FA0C78F63;
	Mon,  5 May 2025 13:37:51 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1193C78F62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 13:37:50 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5459LpfI027658;
 Mon, 5 May 2025 15:37:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 BAc658lP0DD1aUh6EnyZDuLOgwjJWgEsZfkFjvIsXyk=; b=4gb8wetBM3HPkJ75
 u7e7gB9uw/Es9F555ObAWm1cbHeuIESW+dW+r6uvGMfDoq1Gl0K7Rai2UknIZQx0
 SANbZ90BjUafkkK0zW/pP8HBDoiB4H4kSKbEYdvLjDZh8qfM0AG+3jFxnBbmKokc
 Wod13+b9C5dHA3eRO3jYa3tEGY3BJbUQbvk5G4Ty1sha92ydBdLj0Mz1NLBFsIcF
 kflynJXcD4sDpYEU9Z9MT0Bt6Ua5fU4QBlQTpDU5Kdh2COFjmLsby9HOM0znWn5D
 hw7H54HbxfPft39T5TnfNdZJOKYJ5fD+Z877dZYrHIQNixbDL13zYvMt561r+oKJ
 2BcB1g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dx3m4kpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 15:37:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A77314005A;
 Mon,  5 May 2025 15:37:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C558B1F531;
 Mon,  5 May 2025 15:34:39 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 15:34:39 +0200
Message-ID: <2438972e-e77e-4c56-a1c6-891f90862e67@foss.st.com>
Date: Mon, 5 May 2025 15:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401135132.395518-1-patrice.chotard@foss.st.com>
 <20250401135132.395518-2-patrice.chotard@foss.st.com>
 <a272b1de-feb2-4cd7-983b-4ad36532c026@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a272b1de-feb2-4cd7-983b-4ad36532c026@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] configs: stm32f769-disco_spl: Fix
	console cmdline
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

CgpPbiA0LzIyLzI1IDA5OjUwLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpCj4gCj4gT24g
NC8xLzI1IDE1OjUxLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IFRoZSBMaW51eCBjbWRsaW5l
IGVuY29kZWQgaW4gdGhlIGRlZmNvbmZpZyBpcyB3cm9uZywgdGhlCj4+IFNUTTMyIFVTQVJUIGRy
aXZlciByZWdpc3RlcnMgYXMgdHR5U1RNMCBub3QgdHR5UzAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4K
Pj4gwqAgY29uZmlncy9zdG0zMmY3NjktZGlzY29fc3BsX2RlZmNvbmZpZyB8IDIgKy0KPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9jb25maWdzL3N0bTMyZjc2OS1kaXNjb19zcGxfZGVmY29uZmlnIGIvY29uZmlncy9z
dG0zMmY3NjktZGlzY29fc3BsX2RlZmNvbmZpZwo+PiBpbmRleCA2YTNjZGQ0YTBlNC4uOGEyMGM2
YWY4ZjggMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJmNzY5LWRpc2NvX3NwbF9kZWZjb25m
aWcKPj4gKysrIGIvY29uZmlncy9zdG0zMmY3NjktZGlzY29fc3BsX2RlZmNvbmZpZwo+PiBAQCAt
MjcsNyArMjcsNyBAQCBDT05GSUdfQVVUT0JPT1RfS0VZRUQ9eQo+PiDCoCBDT05GSUdfQVVUT0JP
T1RfUFJPTVBUPSJIaXQgU1BBQ0UgaW4gJWQgc2Vjb25kcyB0byBzdG9wIGF1dG9ib290LlxuIgo+
PiDCoCBDT05GSUdfQVVUT0JPT1RfU1RPUF9TVFI9IiAiCj4+IMKgIENPTkZJR19VU0VfQk9PVEFS
R1M9eQo+PiAtQ09ORklHX0JPT1RBUkdTPSJjb25zb2xlPXR0eVMwLDExNTIwMCBlYXJseXByaW50
ayBjb25zb2xlYmxhbms9MCBpZ25vcmVfbG9nbGV2ZWwiCj4+ICtDT05GSUdfQk9PVEFSR1M9ImNv
bnNvbGU9dHR5U1RNMCwxMTUyMDAgZWFybHlwcmludGsgY29uc29sZWJsYW5rPTAgaWdub3JlX2xv
Z2xldmVsIgo+PiDCoCBDT05GSUdfREVGQVVMVF9GRFRfRklMRT0ic3RtMzJmNzY5LWRpc2NvIgo+
PiDCoCBDT05GSUdfU1lTX1BCU0laRT0xMDUwCj4+IMKgICMgQ09ORklHX0RJU1BMQVlfQ1BVSU5G
TyBpcyBub3Qgc2V0Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJp
Y2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IApBcHBsaWVk
IHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
