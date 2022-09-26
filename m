Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 672725EABC1
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 17:56:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2672AC0D2BB;
	Mon, 26 Sep 2022 15:56:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 074A2C03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 15:56:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QB6uXk001381;
 Mon, 26 Sep 2022 17:56:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=OwLpGwzGJTrKLQQp107preAS2bcZ13jTtpzYij2rq8A=;
 b=VJvlS/I0o6zwnGXwP65I6+CMl0Az/FKkWYYNdXlKe+RU1i28X2izBoH6L0D73P+MHhPv
 KNY7suflwrcPMssmSQr4qV5pdtRH9ayiKx9aN0QJ+7i2ceQ2WSTMOD7VkGOgD05VPZM1
 WMNGB7A5tsmY1fyc/LizpnzqPml0B/cRFehTHggo35ulr4hbAqPsrEzTn8H1+6eRlnlx
 ZPE0+WjeI9Z3z69x5FqezlSUiow09jCEO2zA6XutHWq1ZmGT8IwEA34BViirw7ZVaS+l
 Ufdr971LViybl+fueZbJm1Ah+A/2sz67+z6lsEXHLzDQGXeYrfgTiyv2ZR6MKZxJJc19 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjcg95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 17:56:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4483B10002A;
 Mon, 26 Sep 2022 17:56:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4114A23BDFF;
 Mon, 26 Sep 2022 17:56:30 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 17:56:29 +0200
Message-ID: <fc726b98-2e39-2d9a-967b-3357e98c5414@foss.st.com>
Date: Mon, 26 Sep 2022 17:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
 <20220920160436.117811-4-patrice.chotard@foss.st.com>
 <4eddf448-6434-0902-0419-4447259e8f29@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <4eddf448-6434-0902-0419-4447259e8f29@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/7] configs: stm32746g-eval: Fix SPL
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
Cj4+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+Pgo+PiDCoCBjb25maWdzL3N0bTMyNzQ2Zy1ldmFs
X3NwbF9kZWZjb25maWcgfCA3ICsrKystLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvc3RtMzI3
NDZnLWV2YWxfc3BsX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3RtMzI3NDZnLWV2YWxfc3BsX2RlZmNv
bmZpZwo+PiBpbmRleCBhM2I3MTQ2NDU0Li5kOGQ1NWMyZDNjIDEwMDY0NAo+PiAtLS0gYS9jb25m
aWdzL3N0bTMyNzQ2Zy1ldmFsX3NwbF9kZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9zdG0zMjc0
NmctZXZhbF9zcGxfZGVmY29uZmlnCj4+IEBAIC0xLDYgKzEsNiBAQAo+PiDCoCBDT05GSUdfQVJN
PXkKPj4gwqAgQ09ORklHX0FSQ0hfU1RNMzI9eQo+PiAtQ09ORklHX1NZU19URVhUX0JBU0U9MHgw
ODAwODAwMAo+PiArQ09ORklHX1NZU19URVhUX0JBU0U9MHgwODAwOTAwMAo+PiDCoCBDT05GSUdf
U1lTX01BTExPQ19MRU49MHgxMDAwMDAKPj4gwqAgQ09ORklHX1NZU19NQUxMT0NfRl9MRU49MHhF
MDAKPj4gwqAgQ09ORklHX1NQTF9HUElPPXkKPj4gQEAgLTEzLDEwICsxMywxMSBAQCBDT05GSUdf
U1BMX1RFWFRfQkFTRT0weDgwMDAwMDAKPj4gwqAgQ09ORklHX1NZU19QUk9NUFQ9IlUtQm9vdCA+
ICIKPj4gwqAgQ09ORklHX1NQTF9TRVJJQUw9eQo+PiDCoCBDT05GSUdfU1BMX0RSSVZFUlNfTUlT
Qz15Cj4+ICtDT05GSUdfU1BMX1NJWkVfTElNSVQ9MHg5MDAwCj4+IMKgIENPTkZJR19TVE0zMkY3
PXkKPj4gwqAgQ09ORklHX1RBUkdFVF9TVE0zMkY3NDZfRElTQ089eQo+PiDCoCBDT05GSUdfU1BM
PXkKPj4gLUNPTkZJR19TWVNfTE9BRF9BRERSPTB4ODAwODAwMAo+PiArQ09ORklHX1NZU19MT0FE
X0FERFI9MHg4MDA5MDAwCj4+IMKgIENPTkZJR19CVUlMRF9UQVJHRVQ9InUtYm9vdC13aXRoLXNw
bC5iaW4iCj4+IMKgIENPTkZJR19ESVNUUk9fREVGQVVMVFM9eQo+PiDCoCBDT05GSUdfSEFTX0NV
U1RPTV9TWVNfSU5JVF9TUF9BRERSPXkKPj4gQEAgLTI5LDcgKzMwLDcgQEAgQ09ORklHX1VTRV9C
T09UQVJHUz15Cj4+IMKgIENPTkZJR19CT09UQVJHUz0iY29uc29sZT10dHlTMCwxMTUyMDAgZWFy
bHlwcmludGsgY29uc29sZWJsYW5rPTAgaWdub3JlX2xvZ2xldmVsIgo+PiDCoCAjIENPTkZJR19E
SVNQTEFZX0NQVUlORk8gaXMgbm90IHNldAo+PiDCoCBDT05GSUdfQk9BUkRfTEFURV9JTklUPXkK
Pj4gLUNPTkZJR19TUExfUEFEX1RPPTB4ODAwMAo+PiArQ09ORklHX1NQTF9QQURfVE89MHg5MDAw
Cj4+IMKgIENPTkZJR19TUExfTk9fQlNTX0xJTUlUPXkKPj4gwqAgQ09ORklHX1NQTF9CT0FSRF9J
TklUPXkKPj4gwqAgQ09ORklHX1NQTF9TWVNfTUFMTE9DX1NJTVBMRT15Cj4gCj4gCj4gUmV2aWV3
ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4g
Cj4gVGhhbmtzCj4gUGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9uZXh0CgpUaGFu
a3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
