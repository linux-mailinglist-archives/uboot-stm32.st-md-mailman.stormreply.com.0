Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA005EABCA
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 17:57:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6487DC5F1ED;
	Mon, 26 Sep 2022 15:57:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C1C1C5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 15:57:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QEGH48025710;
 Mon, 26 Sep 2022 17:57:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=R+F0z8UTgtYKDNA4D7FedijmO3FypfRWLKJU70R+34I=;
 b=HRxIrqT7UpkQjwLLQp6ylHvV9EPcg+h1VTjVKmf0gfXVc/dXDE4v3GqKaSt/9Gklx0Cb
 oir8plcEQBkEpobMmLP26vYLVhNcLvV168BITKynR/75jp45o2m2TfRTiC7lkNqibU7z
 kOnUrA4WzinpVwSW+Jf54jmrjOFiU9wn5Uso1yD7XCfhvyJnUAOirtDHHvJuAploBPzm
 ERtAXDg4vwxJsIMIMK1aJ8D8Sg6dczfJqvvnJTdHedmSQ74CONWBCLFn8uEsfF3ehe0D
 LfPT01xyuQAsUpkKX1HJrMF7jg1zqBBl8XoXDvLdspBkUAydEswWKhpbceliqd/lWu2J SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jss823kw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 17:57:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1838E10002A;
 Mon, 26 Sep 2022 17:57:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1426723BE00;
 Mon, 26 Sep 2022 17:57:05 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.123) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 17:57:04 +0200
Message-ID: <91689666-855b-8d28-89c9-f4e1ababa701@foss.st.com>
Date: Mon, 26 Sep 2022 17:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220923112033.2458836-1-patrice.chotard@foss.st.com>
 <0ae7d275-a876-e012-9296-c2461dbbb95b@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <0ae7d275-a876-e012-9296-c2461dbbb95b@foss.st.com>
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: DT sync with kernel
 v6.0-rc4 for MCU's boards
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

CgpPbiA5LzI2LzIyIDE0OjUyLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDkvMjMvMjIgMTM6MjAsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRGV2aWNlIHRyZWUgYWxp
Z25tZW50IHdpdGgga2VybmVsIHY2LjAtcmM0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNl
IENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGFy
Y2gvYXJtL2R0cy9zdG0zMjQyOWktZXZhbC11LWJvb3QuZHRzacKgIHzCoCAyICstCj4+IMKgIGFy
Y2gvYXJtL2R0cy9zdG0zMjc0NmctZXZhbC5kdHPCoMKgwqDCoMKgwqDCoMKgwqAgfCAxOCArKysr
LQo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2nCoMKgwqDCoMKgwqDCoCB8
wqAgMiArLQo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJmNDI5LWRpc2NvLXUtYm9vdC5kdHNpIHzC
oCA0ICstCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMmY0MjktZGlzY28uZHRzwqDCoMKgwqDCoMKg
wqDCoCB8IDIwICsrKy0tCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMmY0MjktcGluY3RybC5kdHNp
wqDCoMKgwqDCoCB8IDk0ICsrKysrKysrKysrLS0tLS0tLS0tLS0tCj4+IMKgIGFyY2gvYXJtL2R0
cy9zdG0zMmY0MjkuZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNjkgKysrLS0tLS0t
LS0tLS0tLS0KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMyZjQ2OS1kaXNjby11LWJvb3QuZHRzaSB8
wqAgNCArLQo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJmNDY5LWRpc2NvLmR0c8KgwqDCoMKgwqDC
oMKgwqAgfCAyNCArKysrLS0KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMyZjQ2OS1waW5jdHJsLmR0
c2nCoMKgwqDCoMKgIHwgOTYgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4+IMKgIGFyY2gvYXJt
L2R0cy9zdG0zMmY3LXBpbmN0cmwuZHRzacKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4+IMKgIGFy
Y2gvYXJtL2R0cy9zdG0zMmY3LXUtYm9vdC5kdHNpwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+
PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJmNzQ2LWRpc2NvLmR0c8KgwqDCoMKgwqDCoMKgwqAgfCAx
MiArKysKPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMyZjc0Ni5kdHNpwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCA2NyArLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJm
NzY5LWRpc2NvLmR0c8KgwqDCoMKgwqDCoMKgwqAgfCAxOCArKysrLQo+PiDCoCBhcmNoL2FybS9k
dHMvc3RtMzJoNzQzLmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE5ICsrLS0tCj4+
IMKgIGFyY2gvYXJtL2R0cy9zdG0zMmg3NDNpLWRpc2NvLmR0c8KgwqDCoMKgwqDCoMKgIHzCoCA4
ICstCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMmg3NDNpLWV2YWwuZHRzwqDCoMKgwqDCoMKgwqDC
oCB8wqAgOCArLQo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJoNzUwaS1hcnQtcGkuZHRzwqDCoMKg
wqDCoMKgIHzCoCA4ICstCj4+IMKgIDE5IGZpbGVzIGNoYW5nZWQsIDIwNyBpbnNlcnRpb25zKCsp
LCAyNzAgZGVsZXRpb25zKC0pCj4gCj4gLi4uLi4KPiAKPiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2R0cy9zdG0zMmY0MjktZGlzY28tdS1ib290LmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJm
NDI5LWRpc2NvLXUtYm9vdC5kdHNpCj4+IGluZGV4IGM5OTNmODZiZTguLmRjYzY4YzRiY2MgMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2R0cy9zdG0zMmY0MjktZGlzY28tdS1ib290LmR0c2kKPj4g
KysrIGIvYXJjaC9hcm0vZHRzL3N0bTMyZjQyOS1kaXNjby11LWJvb3QuZHRzaQo+PiBAQCAtMjcs
NyArMjcsNyBAQAo+PiDCoCDCoMKgwqDCoMKgIHNvYyB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB1
LWJvb3QsZG0tcHJlLXJlbG9jOwo+PiAtwqDCoMKgwqDCoMKgwqAgcGluLWNvbnRyb2xsZXIgewo+
PiArwqDCoMKgwqDCoMKgwqAgcGluY3RybEA0MDAyMDAwMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHUtYm9vdCxkbS1wcmUtcmVsb2M7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+
PiDCoCAKPiAKPiBOSVQ6wqAgY2FuIGJlIHNpbXBseSBieSB1c2luZyBhbGlhcwo+IAo+ICZwaW5j
dHJsIHsKPiDCoMKgwqDCoHUtYm9vdCxkbS1wcmUtcmVsb2M7Cj4gfTsKPiAKPiAKPiAKPj4gQEAg
LTE5Myw2ICsxOTMsNiBAQAo+PiDCoMKgwqDCoMKgIHUtYm9vdCxkbS1wcmUtcmVsb2M7Cj4+IMKg
IH07Cj4+IMKgIC0mdGltZXI1IHsKPj4gKyZ0aW1lcnM1IHsKPj4gwqDCoMKgwqDCoCB1LWJvb3Qs
ZG0tcHJlLXJlbG9jOwo+PiDCoCB9Owo+IAo+IAo+IC4uLgo+IAo+IAo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vZHRzL3N0bTMyZjQ2OS1kaXNjby11LWJvb3QuZHRzaSBiL2FyY2gvYXJtL2R0cy9z
dG0zMmY0NjktZGlzY28tdS1ib290LmR0c2kKPj4gaW5kZXggY2QxNzM2MjNlZi4uN2YwMTJiNDlm
MCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMyZjQ2OS1kaXNjby11LWJvb3QuZHRz
aQo+PiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJmNDY5LWRpc2NvLXUtYm9vdC5kdHNpCj4+IEBA
IC0yOCw3ICsyOCw3IEBACj4+IMKgIMKgwqDCoMKgwqAgc29jIHsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHUtYm9vdCxkbS1wcmUtcmVsb2M7Cj4+IC3CoMKgwqDCoMKgwqDCoCBwaW4tY29udHJvbGxl
ciB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBwaW5jdHJsQDQwMDIwMDAwIHsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdS1ib290LGRtLXByZS1yZWxvYzsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IH07Cj4gCj4gTklUOsKgIGNhbiBiZSBzaW1wbHkgYnkgdXNpbmcgYWxpYXMKPiAKPiAmcGluY3Ry
bCB7Cj4gwqDCoMKgwqB1LWJvb3QsZG0tcHJlLXJlbG9jOwo+IH07Cj4gCj4gCj4+IMKgIEBAIC0y
NTYsNiArMjU2LDYgQEAKPj4gwqDCoMKgwqDCoCB1LWJvb3QsZG0tcHJlLXJlbG9jOwo+PiDCoCB9
Owo+PiDCoCAtJnRpbWVyNSB7Cj4+ICsmdGltZXJzNSB7Cj4+IMKgwqDCoMKgwqAgdS1ib290LGRt
LXByZS1yZWxvYzsKPj4gwqAgfTsKPiAKPiAuLi4KPiAKPiAKPiAyIE5JVFMKPiAKPiAKPiBSZXZp
ZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4K
PiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL25leHQKClRo
YW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
