Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D90DE6E75FD
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Apr 2023 11:07:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B61DC6B460;
	Wed, 19 Apr 2023 09:07:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07B8AC65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 09:07:55 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33J8QOAr029270; Wed, 19 Apr 2023 11:07:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SIb+1XqA4HmUQ+dUiI92mjow68i8WZbllO16M/Dj3a4=;
 b=nlnkfYaD6lAOXdckz/6kKFxvJxh4SDLT0tvr87EMaEeuLwKSrnilaIhJVCO3SRKYa8w4
 1D/zf/5BfbTKwcII8HiwMS/J/U8dyYSwczw/okt53iQJdxrw9DDp+xXnzNfmrtMsFRqM
 e8a1MW0fW7jTTgO+ZZW8C4xxWS5h4bn8Aj0r/P+koIgNe+ZgN/yc+fqshnEzXQc64F2C
 ZlOVAADIJ2l1fvMUgmdPNUjJUVQktl5MG7AAccmMj1E0HRbuqzqATwHUXCFbN9wwes9Y
 NulF6zXvHFyUehwUTIfCRCY19Q7zUIbYOcztWUj9AlZbNclb0aBrqu+30IaW+iNHLI+g MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q1qf7gch4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 11:07:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F649100039;
 Wed, 19 Apr 2023 11:07:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 155C52132CB;
 Wed, 19 Apr 2023 11:07:49 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 19 Apr
 2023 11:07:48 +0200
Message-ID: <d59257cc-7808-bca7-2131-b0b21d3f7d3b@foss.st.com>
Date: Wed, 19 Apr 2023 11:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230403060411.223861-1-patrice.chotard@foss.st.com>
 <2e574de8-aa40-d6dd-9403-8b5856ac454a@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <2e574de8-aa40-d6dd-9403-8b5856ac454a@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_05,2023-04-18_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add QSPI support on
 STM32MP13x SoC family
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

CgpPbiA0LzMvMjMgMDk6NDUsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
NC8zLzIzIDA4OjA0LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEFkZCBRU1BJIHN1cHBvcnQg
b24gU1RNMzJNUDEzeCBTb0MgZmFtaWx5Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hv
dGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgYXJjaC9h
cm0vZHRzL3N0bTMybXAxMzEuZHRzaSB8IDE1ICsrKysrKysrKysrKysrKwo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRz
L3N0bTMybXAxMzEuZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTMxLmR0c2kKPj4gaW5kZXgg
M2NmNTFmMDliY2IuLjVhMDY0ZDU1NjZlIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9kdHMvc3Rt
MzJtcDEzMS5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTMxLmR0c2kKPj4gQEAg
LTE5MSw2ICsxOTEsMjEgQEAKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hLXJlcXVl
c3RzID0gPDQ4PjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+IMKgICvCoMKgwqDCoMKgwqDC
oCBxc3BpOiBzcGlANTgwMDMwMDAgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRp
YmxlID0gInN0LHN0bTMyZjQ2OS1xc3BpIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVn
ID0gPDB4NTgwMDMwMDAgMHgxMDAwPiwgPDB4NzAwMDAwMDAgMHgxMDAwMDAwMD47Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJlZy1uYW1lcyA9ICJxc3BpIiwgInFzcGlfbW0iOwo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGludGVycnVwdHMgPSA8R0lDX1NQSSA5MSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZG1hcyA9IDwmbWRtYSAyNiAweDIgMHgxMDEwMDAwMiAweDAgMHgw
PiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8Jm1kbWEgMjYgMHgy
IDB4MTAxMDAwMDggMHgwIDB4MD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYS1uYW1l
cyA9ICJ0eCIsICJyeCI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmcmNj
IFFTUElfSz47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2V0cyA9IDwmcmNjIFFTUElf
Uj47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+ICvC
oMKgwqDCoMKgwqDCoCB9Owo+PiArCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzZG1tYzE6IG1tY0A1
ODAwNTAwMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic3Qs
c3RtMzItc2RtbWMyIiwgImFybSxwbDE4eCIsICJhcm0scHJpbWVjZWxsIjsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYXJtLHByaW1lY2VsbC1wZXJpcGhpZCA9IDwweDIwMjUzMTgwPjsK
PiAKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5h
eUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4gCj4gCj4gCgpBcHBsaWVk
IG9uIHUtYm9vdC1zdG0vbWFzdGVyLCB0aGFua3MKClBhdHJpY2UKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVi
b290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
