Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9AB5EABC8
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 17:56:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4693BC5F1ED;
	Mon, 26 Sep 2022 15:56:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81376C5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 15:56:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QFYUL4004529;
 Mon, 26 Sep 2022 17:56:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qoZmN2IgKRLfQLpuMNj8lvteU8BPVeVTC8VxrcZ42/E=;
 b=yFmKNevI08OyhVsyGNWrcXhVBHGF2yWlc2nbYljeuuR/hwGIdnAPhzMQcwlOprRKD0n0
 gGO5qcLfIHH3jk/FNY0aQxHoJ94y9E56OQAFpUekOS4R+o4L+BlXkkZ9CylH7ol4RbcH
 Ivjp/bBYF/waYURH3RuD0Nzq0do/kKmSDGUVrgNR3adVwPSL+jYkDSK6YThMjFNboSkQ
 0AZxYxwzoix6yBT91C3zAYsNgPEdmuESNeIGI/XuUIJ8DM51TZ4LHLRYMG9dET60/Kas
 2hYNzxvkeVa3KcN7v96IptY4/1u7HZpINLmSvLU1JZby1hFA1Quvm/IjzMCJ9URRCmS7 tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsq1avvch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 17:56:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9247B10002A;
 Mon, 26 Sep 2022 17:56:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E14C23BDFF;
 Mon, 26 Sep 2022 17:56:48 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 17:56:48 +0200
Message-ID: <b47c142e-b9cf-4716-1b91-ce1d9e479d88@foss.st.com>
Date: Mon, 26 Sep 2022 17:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
 <20220920160436.117811-7-patrice.chotard@foss.st.com>
 <a0355dc7-fc90-b57a-9e3a-121430c21688@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a0355dc7-fc90-b57a-9e3a-121430c21688@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 6/7] config: stm32f769-disco: Fix
	internal flash size
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

CgpPbiA5LzI2LzIyIDE1OjA1LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDkvMjAvMjIgMTg6MDQsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gYXJjaC1zdG0zMmY3L3N0
bTMyLmggZmlsZSBpcyBzaGFyZWQgYmV0d2VlbiBTVE0zMkY3NDYgYW5kIFNUTTMyRjc2OQo+PiBN
Q1VzLiBCdXQgU1RNMzJGNzY5IGVtYmVkcyAyTUIgb2YgaW50ZXJuYWwgZmxhc2ggaW5zdGVhZCBv
ZiAxTUIgZm9yCj4+IFNUTTMyRjc0Ni4gVGhlIGZsYXNoIGxheW91dCBpcyBxdWl0ZSBzaW1pbGFy
IGJldHdlZW4gdGhlIDIgU29DcyA6Cj4+Cj4+IMKgwqDCoMKgU1RNMzJGNzQ2wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFNUTTMyRjc2OQo+PiA0ICrCoCAzMktCIHNlY3RvcnPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgNCAqwqAgMzJLQiBzZWN0b3JzCj4+IDEgKiAxMjhLQiBzZWN0b3LCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMSAqIDEyOEtCIHNlY3Rvcgo+PiAzICogMjU2S0Igc2VjdG9yc8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgNyAqIDI1NktCIHNlY3RvcnMKPj4KPj4gVXBkYXRlIHNlY3Rf
c3pfa2JbXSBzdHJ1Y3R1cmUgYW5kIFNZU19NQVhfRkxBU0hfU0VDVCBhY2NvcmRpbmdseS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5z
dC5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiBDaGFuZ2VzIGluIHYyOgo+PiDCoMKgIC0gUmVtb3ZlIFNZ
U19VQk9PVF9GTEFHIGZyb20gc3RtMzJmNzQ2LWRpc2NvLmgKPj4KPj4gwqAgYXJjaC9hcm0vaW5j
bHVkZS9hc20vYXJjaC1zdG0zMmY3L3N0bTMyLmggfCA2ICsrKy0tLQo+PiDCoCBjb25maWdzL3N0
bTMyZjc2OS1kaXNjb19kZWZjb25maWfCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQo+PiDCoCBjb25m
aWdzL3N0bTMyZjc2OS1kaXNjb19zcGxfZGVmY29uZmlnwqDCoMKgwqAgfCAyICstCj4+IMKgIDMg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJjaC1zdG0zMmY3L3N0bTMyLmggYi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9hcmNoLXN0bTMyZjcvc3RtMzIuaAo+PiBpbmRleCAzNDUxZTc0YTNk
Li41N2RiODM5ZThkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcmNoLXN0
bTMyZjcvc3RtMzIuaAo+PiArKysgYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcmNoLXN0bTMyZjcv
c3RtMzIuaAo+PiBAQCAtMTAsOSArMTAsOSBAQAo+PiDCoCAjaW5jbHVkZSA8YXNtL2FyY2gtc3Rt
MzIvc3RtMzJmLmg+Cj4+IMKgIMKgIHN0YXRpYyBjb25zdCB1MzIgc2VjdF9zel9rYltDT05GSUdf
U1lTX01BWF9GTEFTSF9TRUNUXSA9IHsKPj4gLcKgwqDCoCBbMCAuLi4gM10gPcKgwqDCoCAzMiAq
IDEwMjQsCj4+IC3CoMKgwqAgWzRdID3CoMKgwqDCoMKgwqDCoCAxMjggKiAxMDI0LAo+PiAtwqDC
oMKgIFs1IC4uLiA3XSA9wqDCoMKgIDI1NiAqIDEwMjQKPj4gK8KgwqDCoCBbMCAuLi4gM10gPcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAzMiAqIDEwMjQsCj4+ICvCoMKgwqAgWzRdID3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMjggKiAxMDI0LAo+PiArwqDC
oMKgIFs1IC4uLiBDT05GSUdfU1lTX01BWF9GTEFTSF9TRUNUIC0gMV0gPcKgwqDCoCAyNTYgKiAx
MDI0Cj4+IMKgIH07Cj4+IMKgIMKgICNlbmRpZiAvKiBfQVNNX0FSQ0hfSEFSRFdBUkVfSCAqLwo+
PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9zdG0zMmY3NjktZGlzY29fZGVmY29uZmlnIGIvY29uZmln
cy9zdG0zMmY3NjktZGlzY29fZGVmY29uZmlnCj4+IGluZGV4IDQyM2FmNzQ0NmEuLjViNTMwN2Nh
MWQgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJmNzY5LWRpc2NvX2RlZmNvbmZpZwo+PiAr
KysgYi9jb25maWdzL3N0bTMyZjc2OS1kaXNjb19kZWZjb25maWcKPj4gQEAgLTQxLDcgKzQxLDcg
QEAgQ09ORklHX01URD15Cj4+IMKgIENPTkZJR19ETV9NVEQ9eQo+PiDCoCBDT05GSUdfTVREX05P
Ul9GTEFTSD15Cj4+IMKgIENPTkZJR19TVE0zMl9GTEFTSD15Cj4+IC1DT05GSUdfU1lTX01BWF9G
TEFTSF9TRUNUPTgKPj4gK0NPTkZJR19TWVNfTUFYX0ZMQVNIX1NFQ1Q9MTIKPj4gwqAgQ09ORklH
X0RNX1NQSV9GTEFTSD15Cj4+IMKgIENPTkZJR19TUElfRkxBU0hfTUFDUk9OSVg9eQo+PiDCoCBD
T05GSUdfU1BJX0ZMQVNIX1NUTUlDUk89eQo+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9zdG0zMmY3
NjktZGlzY29fc3BsX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3RtMzJmNzY5LWRpc2NvX3NwbF9kZWZj
b25maWcKPj4gaW5kZXggYjU2ZDg4ZjlmNi4uYjVkNTRiNDhlYyAxMDA2NDQKPj4gLS0tIGEvY29u
Zmlncy9zdG0zMmY3NjktZGlzY29fc3BsX2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL3N0bTMy
Zjc2OS1kaXNjb19zcGxfZGVmY29uZmlnCj4+IEBAIC02Myw3ICs2Myw3IEBAIENPTkZJR19NVEQ9
eQo+PiDCoCBDT05GSUdfRE1fTVREPXkKPj4gwqAgQ09ORklHX01URF9OT1JfRkxBU0g9eQo+PiDC
oCBDT05GSUdfU1RNMzJfRkxBU0g9eQo+PiAtQ09ORklHX1NZU19NQVhfRkxBU0hfU0VDVD04Cj4+
ICtDT05GSUdfU1lTX01BWF9GTEFTSF9TRUNUPTEyCj4+IMKgIENPTkZJR19ETV9TUElfRkxBU0g9
eQo+PiDCoCBDT05GSUdfU1BJX0ZMQVNIX01BQ1JPTklYPXkKPj4gwqAgQ09ORklHX1NQSV9GTEFT
SF9TVE1JQ1JPPXkKPiAKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0
cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxp
ZWQgdG8gdS1ib290LXN0bTMyL25leHQKClRoYW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
