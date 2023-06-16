Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCF4732FEA
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 13:34:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59598C65E58;
	Fri, 16 Jun 2023 11:34:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BC13C64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 11:34:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35G85oVk021489; Fri, 16 Jun 2023 13:34:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Co6/sscmDu1UtuzxqPa8ei7PITgCGhEc1gNAdPVlk2g=;
 b=76SOByrozuik3r2hBfrNfl1VsYPE/jAYXrITpGuPOUOeupLUGYY9CvyFWkwSIRU+Qogb
 42eRLHFyPb1OfydhGtS68WnyE9LZeJ0RL6cmzF1CcWquqX8BGow7FcE2uGhAYQe2InSs
 s1/J1pz6nUMn5/cPNblIDpn1+S4R2SmagjRf4CVBQWLg4ZLEvIFNVi1WQStQ6TFAmViI
 v8AROhafCX8qMwO0AKS+0DvJmw+FNP6BXYRCS+lgRFbAqZSdKChxUJgiSFk9TMSJLWpC
 Nt1/mWq19GWKrp50yGatonXeJAXN9ftJVgUbrhS1FV4warXcFVBnle4NEvWQc3i0XvXv GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8kx2hd4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 13:34:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2AB1210002A;
 Fri, 16 Jun 2023 13:34:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D5B5231513;
 Fri, 16 Jun 2023 13:34:39 +0200 (CEST)
Received: from [10.252.4.57] (10.252.4.57) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 13:34:38 +0200
Message-ID: <e4859950-92fe-7308-fdbf-28400a521a42@foss.st.com>
Date: Fri, 16 Jun 2023 13:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230531060131.2045931-1-patrice.chotard@foss.st.com>
 <20230531060131.2045931-2-patrice.chotard@foss.st.com>
 <72c4647d-a725-35ea-e659-d6784e8c7fec@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <72c4647d-a725-35ea-e659-d6784e8c7fec@foss.st.com>
X-Originating-IP: [10.252.4.57]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] serial: stm32: BRR must be set only
 when usart is disable
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

CgpPbiA2LzE2LzIzIDExOjAzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDUvMzEvMjMgMDg6MDEsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gVG8gYXZvaWQgc3B1cmlv
dXMgY2hhcnMsIEJSUiByZWdpc3RlciBtdXN0IG9ubHkgYmUgd3JpdHRlbiB3aGVuCj4+IFVTQVJU
IGlzIGRpc2FibGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGRyaXZlcnMvc2VyaWFsL3Nl
cmlhbF9zdG0zMi5jIHwgNiArKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQo+Pgo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRl
bGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKQXBwbGllZCB0byB1
LWJvb3Qtc3RtL25leHQKClRoYW5rcwoKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
