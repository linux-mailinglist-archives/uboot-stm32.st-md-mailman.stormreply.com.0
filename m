Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB16678ED
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:19:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26276C69049;
	Thu, 12 Jan 2023 15:19:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34914C69048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:18:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CBHMAl003657; Thu, 12 Jan 2023 16:18:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Ls20Y/u0W+GqTsYCT+1mGYmcWw3ktm5LqRH5bOV0TC0=;
 b=1qH3NnVZUgo4gLgA0ufA4qq+r35FUXxwgEpE9hlbm+164/Dkmq+1enK0oYpw5P8l8Izk
 iE49BukXR8+c9texCHkr0PVTWaUdukH45jrrulbzXdc2eBnBLIfv0Hu+wnRztbz37OZz
 3rMgF4wJuK83DTUxBYn6g0USncvxc43G7dANG8GX1OUl1cwW9gBs/uIMWLD3FjR4CmL8
 Jey7fmpSblDLB+Yei4c/vY5t7u/MJpSFh4A/oWYrjlnGl7KxOqAvOTvVVtW/w5tslwYS
 zYX4Gz5wM0KAERs03pTrt3S9+ArW1sjjLaIxCG7cgHGJZUCZnaIKJEx+1szwbJw+Ansg cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1k64kuk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 16:18:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E285100034;
 Thu, 12 Jan 2023 16:18:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8174421ADDB;
 Thu, 12 Jan 2023 16:18:57 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 16:18:56 +0100
Message-ID: <d68f7917-a230-f5cf-baeb-05d0d716d845@foss.st.com>
Date: Thu, 12 Jan 2023 16:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221212103242.14137-1-fabrice.gasnier@foss.st.com>
 <1daa0d96-7ea0-bd5a-2ba7-89cc00776f67@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <1daa0d96-7ea0-bd5a-2ba7-89cc00776f67@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: update vbus-supply of
 usbphyc_port0 on stm32mp157c-ev1
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

SGkgRmFicmljZQoKT24gMS8zLzIzIDE3OjI3LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhp
LAo+IAo+IE9uIDEyLzEyLzIyIDExOjMyLCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4+IHBoeS1z
dG0zMi11c2JwaHljIGJpbmRpbmdzIHVzZXMgYSBjb25uZWN0b3Igbm9kZSB3aXRoIHZidXMtc3Vw
cGx5Cj4+IHByb3BlcnR5Lgo+Pgo+PiBbYmFja3BvcnQgZnJvbSBsaW51eCA0M2U1NWQ3NzhhNmJd
Cj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Mu
c3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMg
fCA0ICsrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMgYi9hcmNoL2FybS9kdHMv
c3RtMzJtcDE1N2MtZXYxLmR0cwo+PiBpbmRleCAwN2JjZDdjNTA2NzIuLjJkNWRiNDFlZDY3YiAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMKPj4gKysrIGIv
YXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMKPj4gQEAgLTM5Myw2ICszOTMsMTAgQEAK
Pj4gwqDCoMKgwqDCoCBzdCx0dW5lLXNxdWVsY2gtbGV2ZWwgPSA8Mz47Cj4+IMKgwqDCoMKgwqAg
c3QsdHVuZS1ocy1yeC1vZmZzZXQgPSA8Mj47Cj4+IMKgwqDCoMKgwqAgc3Qsbm8tbHNmcy1zYzsK
Pj4gK8KgwqDCoCBjb25uZWN0b3Igewo+PiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJ1
c2ItYS1jb25uZWN0b3IiOwo+PiArwqDCoMKgwqDCoMKgwqAgdmJ1cy1zdXBwbHkgPSA8JnZidXNf
c3c+Owo+PiArwqDCoMKgIH07Cj4+IMKgIH07Cj4+IMKgIMKgICZ1c2JwaHljX3BvcnQxIHsKPiAK
PiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBm
b3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCgpBcHBsaWVkIG9uIHUtYm9vdC1z
dG0zMi9tYXN0ZXIKClRoYW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
