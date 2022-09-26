Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 518895EABC0
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 17:56:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1804DC0D2BB;
	Mon, 26 Sep 2022 15:56:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FAB3C03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 15:56:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QFl1hX017486;
 Mon, 26 Sep 2022 17:56:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=g/EA2nJFMez1F34n6P2rAd2ROR2Vk78uyi0Y1+NRi2k=;
 b=fcYs7DFsi8/eAcXIncZ+kjKbe345YJPk6XuS0/pqvzfPwVVbtS1qR3RiUkeiG9KESpLw
 Wuyi3JUv4RmR+XPhrxrB5ON1Kmx3PfqDUfu2wj//qDa1OAir21WEevrVLmqG+kzlg2pG
 1jnlfO94gIVWqdyrV1SC1RBWieRH0XL+3viNqmeY+pC1nAA6hnO/H0wc7yZQimkAT6R+
 2SvwNAM8zC8MdCWEQMNgG7v4g1cLZMMnjPNehKLFRly6Ua1U+/2x+87Rz5KDoVkFzwns
 C4EoYM28UNjH+xTL3FQKqNUi6RCoMrHRc72yeNJg6Fh2mN0jQp/MJLzscECGFma5dUTA QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjcg8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 17:56:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08047100034;
 Mon, 26 Sep 2022 17:56:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0448623BDFF;
 Mon, 26 Sep 2022 17:56:24 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.123) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 17:56:23 +0200
Message-ID: <f28636f0-5ce9-c70f-4fc8-a23abd5029cf@foss.st.com>
Date: Mon, 26 Sep 2022 17:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
 <20220920160436.117811-3-patrice.chotard@foss.st.com>
 <c0c00ac0-f58e-436e-8cf1-be98213bf2d7@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <c0c00ac0-f58e-436e-8cf1-be98213bf2d7@foss.st.com>
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/7] configs: stm32f769-disco: Fix SPL
	boot
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

CgpPbiA5LzI2LzIyIDE0OjU3LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDkvMjAvMjIgMTg6MDQsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gQ29tbWl0ICdiNGI5YTAw
ZWQ1OTMgKCJDb252ZXJ0IENPTkZJR19TWVNfU1BMX0FSR1NfQUREUiB0byBLY29uZmlnIiknCj4+
IHJlcGxhY2VzIENPTkZJR19TWVNfRkRUX0JBU0UgYnkgQ09ORklHX1NZU19TUExfQVJHU19BRERS
Lgo+PiBBcyBDT05GSUdfU1lTX1NQTF9BUkdTX0FERFIgZW5hYmxlcyBhZGRpdGlvbmFsIGNvZGUg
d2hlbiBlbmFibGUsIGl0Cj4+IGluY3JlYXNlcyBTUEwgc2l6ZSBvdmVyIHRoZSBpbml0aWFsIDB4
ODAwMCBsaW1pdC4KPj4gSW5jcmVhc2UgdGhlIFNQTCBzaXplIHRvIDB4OTAwMCB0byBmaXggU1BM
IGJvb3QuCj4+IFNldCBTUExfU0laRV9MSU1JVCB0byAweDkwMDAgdG8gYXZvaWQgc2ltaWxhciBp
c3N1ZSBpbiB0aGUgZnV0dXJlLgo+Pgo+PiBGaXhlcyAnYjRiOWEwMGVkNTkzICgiQ29udmVydCBD
T05GSUdfU1lTX1NQTF9BUkdTX0FERFIgdG8gS2NvbmZpZyIpJwo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+
Cj4+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+Pgo+PiDCoCBjb25maWdzL3N0bTMyZjc2OS1kaXNj
b19zcGxfZGVmY29uZmlnIHwgNyArKysrLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMy
Zjc2OS1kaXNjb19zcGxfZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMmY3NjktZGlzY29fc3BsX2Rl
ZmNvbmZpZwo+PiBpbmRleCAxOWQyYzI0YWJiLi5iNTZkODhmOWY2IDEwMDY0NAo+PiAtLS0gYS9j
b25maWdzL3N0bTMyZjc2OS1kaXNjb19zcGxfZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvc3Rt
MzJmNzY5LWRpc2NvX3NwbF9kZWZjb25maWcKPj4gQEAgLTEsNiArMSw2IEBACj4+IMKgIENPTkZJ
R19BUk09eQo+PiDCoCBDT05GSUdfQVJDSF9TVE0zMj15Cj4+IC1DT05GSUdfU1lTX1RFWFRfQkFT
RT0weDA4MDA4MDAwCj4+ICtDT05GSUdfU1lTX1RFWFRfQkFTRT0weDA4MDA5MDAwCj4+IMKgIENP
TkZJR19TWVNfTUFMTE9DX0xFTj0weDEwMDAwMAo+PiDCoCBDT05GSUdfU1lTX01BTExPQ19GX0xF
Tj0weEUwMAo+PiDCoCBDT05GSUdfU1BMX0dQSU89eQo+PiBAQCAtMTMsMTAgKzEzLDExIEBAIENP
TkZJR19TUExfVEVYVF9CQVNFPTB4ODAwMDAwMAo+PiDCoCBDT05GSUdfU1lTX1BST01QVD0iVS1C
b290ID4gIgo+PiDCoCBDT05GSUdfU1BMX1NFUklBTD15Cj4+IMKgIENPTkZJR19TUExfRFJJVkVS
U19NSVNDPXkKPj4gK0NPTkZJR19TUExfU0laRV9MSU1JVD0weDkwMDAKPj4gwqAgQ09ORklHX1NU
TTMyRjc9eQo+PiDCoCBDT05GSUdfVEFSR0VUX1NUTTMyRjc0Nl9ESVNDTz15Cj4+IMKgIENPTkZJ
R19TUEw9eQo+PiAtQ09ORklHX1NZU19MT0FEX0FERFI9MHg4MDA4MDAwCj4+ICtDT05GSUdfU1lT
X0xPQURfQUREUj0weDgwMDkwMDAKPj4gwqAgQ09ORklHX0JVSUxEX1RBUkdFVD0idS1ib290LXdp
dGgtc3BsLmJpbiIKPj4gwqAgQ09ORklHX0RJU1RST19ERUZBVUxUUz15Cj4+IMKgIENPTkZJR19I
QVNfQ1VTVE9NX1NZU19JTklUX1NQX0FERFI9eQo+PiBAQCAtMjgsNyArMjksNyBAQCBDT05GSUdf
QVVUT0JPT1RfU1RPUF9TVFI9IiAiCj4+IMKgIENPTkZJR19VU0VfQk9PVEFSR1M9eQo+PiDCoCBD
T05GSUdfQk9PVEFSR1M9ImNvbnNvbGU9dHR5UzAsMTE1MjAwIGVhcmx5cHJpbnRrIGNvbnNvbGVi
bGFuaz0wIGlnbm9yZV9sb2dsZXZlbCIKPj4gwqAgIyBDT05GSUdfRElTUExBWV9DUFVJTkZPIGlz
IG5vdCBzZXQKPj4gLUNPTkZJR19TUExfUEFEX1RPPTB4ODAwMAo+PiArQ09ORklHX1NQTF9QQURf
VE89MHg5MDAwCj4+IMKgIENPTkZJR19TUExfTk9fQlNTX0xJTUlUPXkKPj4gwqAgQ09ORklHX1NQ
TF9CT0FSRF9JTklUPXkKPj4gwqAgQ09ORklHX1NQTF9TWVNfTUFMTE9DX1NJTVBMRT15Cj4gCj4g
Cj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5z
dC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9u
ZXh0CgpUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vdWJvb3Qtc3RtMzIK
