Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3EF732FEB
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 13:34:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65AF6C65E58;
	Fri, 16 Jun 2023 11:34:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C476BC64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 11:34:51 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35G8IYVo008714; Fri, 16 Jun 2023 13:34:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QkMRtWH04t6b+SbLa/o4OPEPb3W37j+GY7BY7SxZVfs=;
 b=fbEg2oLov/LL08HvQd/jdvyCcTwejuJ2460/xuacQyGFhCqzhZUXxnLIS+SFxxscmrbt
 h1vgiRul1Z7THzxKLYrA3KNIpTRO7EUOw7OOaJNucTST2HzNQczZ8zvI4k3PulxpQ01C
 Dc5mp8qRF6o41L4Oum+kzJLxIpHZVqQ5qqT5+5LSW1ZH/n8uQI7jL/q0FAVI1I18Iw2g
 +cL69mnQrFtOK/R2hT4KK7LW2On8R1xgMW+gD3ga7Da/Z1qkleynckeIVjEU1qMIuYQh
 WUAOZD8iul/9Ka8v8Lk6GsNZDLmCfOM9eKr7FcaQ3dDfTNcYQAjnJcm6mFvY5GFELvGA GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8m44h9tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 13:34:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 273D510002A;
 Fri, 16 Jun 2023 13:34:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2052C231507;
 Fri, 16 Jun 2023 13:34:50 +0200 (CEST)
Received: from [10.252.4.57] (10.252.4.57) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 13:34:49 +0200
Message-ID: <ffac26fc-590c-f95c-98ac-4a8b4300fe61@foss.st.com>
Date: Fri, 16 Jun 2023 13:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230531060131.2045931-1-patrice.chotard@foss.st.com>
 <ab788274-f9c7-6452-cf65-64921bebc7d9@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ab788274-f9c7-6452-cf65-64921bebc7d9@foss.st.com>
X-Originating-IP: [10.252.4.57]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] serial: stm32: Wait TC bit before
 performing initialization
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

CgpPbiA2LzE2LzIzIDExOjAyLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDUvMzEvMjMgMDg6MDEsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gSW4gY2FzZSB0aGVyZSBp
cyBzdGlsbCBjaGFycyBmcm9tIHByZXZpb3VzIGJvb3RzdGFnZSB0byB0cmFuc21pdCwgd2FpdAo+
PiBmb3IgVEMgKFRyYW5zbWlzc2lvbiBDb21wbGV0ZSkgYml0IHRvIGJlIHNldCB3aGljaCBlbnN1
cmUgdGhhdCB0aGUgbGFzdAo+PiBkYXRhIHdyaXR0ZW4gaW4gdGhlIFVTQVJUX1REUiBoYXMgYmVl
biB0cmFuc21pdHRlZCBvdXQgb2YgdGhlIHNoaWZ0Cj4+IHJlZ2lzdGVyLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4g
LS0tCj4+Cj4+IMKgIGRyaXZlcnMvc2VyaWFsL3NlcmlhbF9zdG0zMi5jIHwgMTUgKysrKysrKysr
KysrKysrCj4+IMKgIGRyaXZlcnMvc2VyaWFsL3NlcmlhbF9zdG0zMi5oIHzCoCAxICsKPj4gwqAg
MiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4+Cj4gCj4gUmV2aWV3ZWQtYnk6IFBh
dHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtz
Cj4gUGF0cmljawo+IAo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0vbmV4dAoKVGhhbmtzCgpQYXRy
aWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==
