Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E34EA23A7B
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 09:12:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDB38C78002;
	Fri, 31 Jan 2025 08:12:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5873AC71292
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:12:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V80wu6012210;
 Fri, 31 Jan 2025 09:12:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 9wmxY4iYkUNU063hceEtVTkj7QCiBjuLuFR0hAkhL+U=; b=eSnvxPSSdzvpT+NH
 HGQIpgkXu/fwxTjEcdT6op6XTaF0L/soBIoz/E5klUwkGBDvjKECRg/KkAXf27rB
 ybjg230lrICXNaJ24bvdpQiQeIml6mCmbwxo1k+haBKT5FTQ+75E8NiCHOO5RGd7
 F3KvN2xiOeqL3CNncAna+EdgoUgdCeLZ82ozC/y0TNI8YNorqOKwp1CkiB2GT164
 EE3Iwwh6I46G+tXabZlBvRG1UW1JLL0/7EfTsU+U/YuqKXX8c4/0vq2Vxuu2n0/j
 uNGseQye/qNRslK2SSaWB27+nQ1X/ZFXrLa/Ai89YageNBqAj+GYqxyXkD5TxicG
 r4mMMQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7d9spe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 09:12:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CEC4A4004B;
 Fri, 31 Jan 2025 09:11:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 023C9281AEF;
 Fri, 31 Jan 2025 09:06:37 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 09:06:36 +0100
Message-ID: <4a0771a4-fabe-4f23-8437-c245822c243d@foss.st.com>
Date: Fri, 31 Jan 2025 09:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241211080936.1133105-1-patrice.chotard@foss.st.com>
 <a6c8c93d-0f9f-41c4-9874-2c57544e4eac@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a6c8c93d-0f9f-41c4-9874-2c57544e4eac@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] configs: stm32f769-disco: Set
 CYCLIC_MAX_CPU_TIME_US to 8000 for stm32f769-disco
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

CgpPbiAxLzgvMjUgMTk6NTMsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MTIvMTEvMjQgMDk6MDksIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gVXBkYXRpbmcgdGhlIGZy
YW1lYnVmZmVyIHRha2VzIHF1aXRlIGEgbG9uZyB0aW1lIG9uIHRoaXMgc2xvdyBwYXRmb3JtLAo+
PiBzZXQgQ1lDTElDX01BWF9DUFVfVElNRV9VUyB0byA4MDAwIGZvciBzdG0zMmY3NjktZGlzY28g
dG8gYXZvaWQKPj4gZm9sbG93aW5nIGN5Y2xpYyB3YXJuaW5nOgo+Pgo+PiAiY3ljbGljIGZ1bmN0
aW9uIHZpZGVvX2luaXQgdG9vayB0b28gbG9uZzogNzI4MHVzIHZzIDUwMDB1cyBtYXgiCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3Qu
Y29tPgo+PiAtLS0KPj4KPj4gwqAgY29uZmlncy9zdG0zMmY3NjktZGlzY29fZGVmY29uZmlnwqDC
oMKgwqAgfCAxICsKPj4gwqAgY29uZmlncy9zdG0zMmY3NjktZGlzY29fc3BsX2RlZmNvbmZpZyB8
IDEgKwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvY29uZmlncy9zdG0zMmY3NjktZGlzY29fZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMmY3
NjktZGlzY29fZGVmY29uZmlnCj4+IGluZGV4IDFlMDljMjI0ZmMwLi41YmUyMjFhZmQyZiAxMDA2
NDQKPj4gLS0tIGEvY29uZmlncy9zdG0zMmY3NjktZGlzY29fZGVmY29uZmlnCj4+ICsrKyBiL2Nv
bmZpZ3Mvc3RtMzJmNzY5LWRpc2NvX2RlZmNvbmZpZwo+PiBAQCAtMjEsNiArMjEsNyBAQCBDT05G
SUdfVVNFX0JPT1RBUkdTPXkKPj4gwqAgQ09ORklHX0JPT1RBUkdTPSJjb25zb2xlPXR0eVMwLDEx
NTIwMCBlYXJseXByaW50ayBjb25zb2xlYmxhbms9MCBpZ25vcmVfbG9nbGV2ZWwiCj4+IMKgIENP
TkZJR19TWVNfUEJTSVpFPTEwNTAKPj4gwqAgIyBDT05GSUdfRElTUExBWV9DUFVJTkZPIGlzIG5v
dCBzZXQKPj4gK0NPTkZJR19DWUNMSUNfTUFYX0NQVV9USU1FX1VTPTgwMDAKPj4gwqAgQ09ORklH
X1NZU19QUk9NUFQ9IlUtQm9vdCA+ICIKPj4gwqAgQ09ORklHX0NNRF9HUFQ9eQo+PiDCoCBDT05G
SUdfQ01EX01NQz15Cj4+IGRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMyZjc2OS1kaXNjb19zcGxf
ZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMmY3NjktZGlzY29fc3BsX2RlZmNvbmZpZwo+PiBpbmRl
eCA3ODc1NzFkYmEwYy4uN2Q0YmRhNDQwNjggMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJm
NzY5LWRpc2NvX3NwbF9kZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9zdG0zMmY3NjktZGlzY29f
c3BsX2RlZmNvbmZpZwo+PiBAQCAtMzAsNiArMzAsNyBAQCBDT05GSUdfVVNFX0JPT1RBUkdTPXkK
Pj4gwqAgQ09ORklHX0JPT1RBUkdTPSJjb25zb2xlPXR0eVMwLDExNTIwMCBlYXJseXByaW50ayBj
b25zb2xlYmxhbms9MCBpZ25vcmVfbG9nbGV2ZWwiCj4+IMKgIENPTkZJR19TWVNfUEJTSVpFPTEw
NTAKPj4gwqAgIyBDT05GSUdfRElTUExBWV9DUFVJTkZPIGlzIG5vdCBzZXQKPj4gK0NPTkZJR19D
WUNMSUNfTUFYX0NQVV9USU1FX1VTPTgwMDAKPj4gwqAgQ09ORklHX1NQTF9QQURfVE89MHg5MDAw
Cj4+IMKgIENPTkZJR19TUExfTk9fQlNTX0xJTUlUPXkKPj4gwqAgQ09ORklHX1NQTF9CT0FSRF9J
TklUPXkKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxh
dW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4gCkFwcGxpZWQgdG8g
dS1ib290LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
