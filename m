Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F66B2207
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Mar 2023 11:58:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8746DC6A609;
	Thu,  9 Mar 2023 10:58:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE68EC6A5FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 10:58:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3299hKtZ031558; Thu, 9 Mar 2023 11:58:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ItdAAodqIhVaLs6Crefo2w59ab5qDYuZU9YAvywRBmg=;
 b=xfStmHNZM989s0Fic/DxgEzAjv2wLCD+UcFK+V7mrYdQ0BGRK7L64fVTN0oM7/THSOiF
 RN7YdvQplYq74jOgyLUFeuMzRnuVMlgXyKPH4XCL+4kvx+n7u6Dpci9qUOCn/nisUN0e
 ho1wsZVf1nBIWqNKVIYYfRz5nUopOx+vFaCSIYN6MnOodihuD9HyzVTP9CTq+1FYpg5G
 8jXYccxc1tN7mc4Nzmd1ebyWtW3jXoZOUVV4ymBsHYaKMyAVY813AzxxuG+G63A2PTAM
 ybDI9kLOeM3LMzPybzeDC6Hk79HJYS8MaZuz/Y1gqEbzn+4gO/dk1YFVv931bJTWxBO5 oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3p6fdru87y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 11:58:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA7D910002A;
 Thu,  9 Mar 2023 11:58:38 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A35982132C8;
 Thu,  9 Mar 2023 11:58:38 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 9 Mar
 2023 11:58:35 +0100
Message-ID: <b69d5da5-42a3-aeb9-31b0-89d1ac1eeda4@foss.st.com>
Date: Thu, 9 Mar 2023 11:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20230308132649.355398-1-patrick.delaunay@foss.st.com>
 <20230308142555.1.I43130d8c0b1b4b863e2cbd9bcb26e07e44e5e235@changeid>
 <b5c22f81-4312-9d0b-d87d-19ddb4f95833@gmx.de>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <b5c22f81-4312-9d0b-d87d-19ddb4f95833@gmx.de>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_06,2023-03-08_03,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] efi: remove error in efi_disk_probe
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGksCgpPbiAzLzkvMjMgMDk6NTcsIEhlaW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4gT24gMy84
LzIzIDE0OjI2LCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBFRkkgaGFzIG5vIHJlYXNvbiB0
byBibG9jayB0aGUgZG0gY29yZSBkZXZpY2VfcHJvYmUoKSBpbiB0aGUgY2FsbGJhY2sKPj4gZWZp
X2Rpc2tfcHJvYmUoKSByZWdpc3RlcmVkIHdpdGggRVZUX0RNX1BPU1RfUFJPQkUuCj4+Cj4+IFRo
aXMgcGF0Y2ggYXZvaWRzIHRvIGhhdmUgZXJyb3IgaW4gRE0gY29yZSBvbiBkZXZpY2VfcHJvYmUo
KQo+Pgo+PiDCoMKgIHJldCA9IGRldmljZV9ub3RpZnkoZGV2LCBFVlRfRE1fUE9TVF9QUk9CRSk7
Cj4+Cj4+IG9ubHkgYmVjYXVzZSBFRkkgaXMgbm90IGFibGUgdG8gY3JlYXRlIGl0cyBpbnN0YW5j
ZS9oYW5kbGUuCj4KPiBUaGlzIHNob3VsZCBvbmx5IG9jY3VyIGlmIHdlIGFyZSBvdXQgb2YgbWVt
b3J5IG9yIGlmIHlvdSBjYWxsCj4gZWZpX2Rpc2tfcHJvYmUoKSB0d2ljZSBmb3IgdGhlIHNhbWUg
ZGV2aWNlLgoKCk9LCgoKPgo+Cj4+Cj4+IEZvciBleGFtcGxlIG9uIHVzYiBzdGFydCwgd2hlbiB0
aGUgU0FNRSBLRVkgKFBJRC9WSUQpIGlzIHByZXNlbnQgb24KPj4gMiBwb3J0cyBvZiB0aGUgVVNC
IEhVQiwgdGhlIDJuZCBrZXkgaGF2ZSB0aGUgc2FtZSBFRkkgZGV2aWNlIHBhdGgKPj4gd2l0aCB0
aGUgY2FsbCBzdGFjazoKPgo+IFdlIG5lZWQgdGhlIEhVQiBkZXZpY2Ugd2l0aCBpdHMgVVNCIHBv
cnQgaW4gdGhlIGRldmljZSBwYXRoLgoKCm9rCgoKc3RydWN0IGVmaV9kZXZpY2VfcGF0aF91c2Jf
Y2xhc3MgewogwqDCoCDCoHN0cnVjdCBlZmlfZGV2aWNlX3BhdGggZHA7CiDCoMKgIMKgdTE2IHZl
bmRvcl9pZDsKIMKgwqAgwqB1MTYgcHJvZHVjdF9pZDsKIMKgwqAgwqB1OCBkZXZpY2VfY2xhc3M7
CiDCoMKgIMKgdTggZGV2aWNlX3N1YmNsYXNzOwogwqDCoCDCoHU4IGRldmljZV9wcm90b2NvbDsK
fSBfX3BhY2tlZDsKCgpTbyBhIGNvcnJlY3Rpb24gbmVlZCB0byBiZSBkb25lIGluIAouL2xpYi9l
ZmlfbG9hZGVyL2VmaV9kZXZpY2VfcGF0aC5jOmRwX2ZpbGwoKQoKIMKgwqDCoCBjYXNlIFVDTEFT
U19NQVNTX1NUT1JBR0U6CiDCoMKgIMKgY2FzZSBVQ0xBU1NfVVNCX0hVQjoKCmFuZCAuL2xpYi9l
ZmlfbG9hZGVyL2VmaV9kZXZpY2VfcGF0aF90b190ZXh0LmM6OmRwX21zZ2luZygpCgogwqDCoMKg
IGNhc2UgREVWSUNFX1BBVEhfU1VCX1RZUEVfTVNHX1VTQl9DTEFTUwoKCnRvIGFkZCBVU0IgcG9y
dCBvciBvdGhlciBpZGVudGlmaWVyICh1c2IgZGV2IG51bWJlciBmb3IgZXhhbXBsZSkgdG8gCmlk
ZW50aWZ5IGVhY2ggZGV2aWNlCgphbmQgbm90IG9ubHkgdXNlIFBJRC9WSUQgYXMgdG9kYXkuCgoK
Zm9yIGV4YW1wbGUgdXNlIGRldmljZSBJRCBhcyBpdCBpcyBkb25lCgpVQ0xBU1NfTlZNRSA9PiBk
cC0+aGJhX3BvcnQgPSBkZXNjLT5kZXZudW07CgpVQ0xBU1NfSURFID0+IGRwLT5sb2dpY2FsX3Vu
aXRfbnVtYmVyID0gZGVzYy0+ZGV2bnVtOwoKCj4KPiBUaGUgd2F5IHdlIGN1cnJlbnRseSBjcmVh
dGUgZGV2aWNlIHBhdGhzIGlzIG5vdCBnb29kLiBXZSBzaG91bGQgdHJhdmVyc2UKPiB0aGUgZG0g
dHJlZSB0byB0aGUgcm9vdCBhbmQgY3JlYXRlIGEgbm9kZSBmb3IgZWFjaCBkbSBkZXZpY2UuIFRo
ZSBjb2RlCj4gY29kZSBmb3IgY3JlYXRpbmcgdGhlIGluZGl2aWR1YWwgbm9kZXMgc2hvdWxkIGJl
IG1vdmVkIHRvIHVjbGFzc2VzLgoKCkkgdGhpbmsgdGhhdCB0aGUgVVNCIHBvcnQgbnVtYmVyIGNh
biBiZSBmb3VuZCBpbiBVU0IgRE0gaW4gdXNiX2RldmljZTogCnVkZXYtPnBvcnRucgoKClBTOiBo
dWJfYWRkcmVzcyBjYW4gYmUgYWxzbyBmb3VuZCB3aXRoIHVkZXYtPnBhcmVudC0+ZGV2bnVtOwoK
Cj4KPiBAU2ltb246IGlzIHRoYXQgb2sgZm9yIHlvdT8KPgo+Pgo+PiBlZmlfZGlza19wcm9iZSgp
Cj4+IMKgwqDCoMKgZWZpX2Rpc2tfY3JlYXRlX3JhdygpCj4+IMKgwqDCoMKgwqDCoMKgIGVmaV9k
aXNrX2FkZF9kZXYoKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVmaV9pbnN0YWxsX211bHRp
cGxlX3Byb3RvY29sX2ludGVyZmFjZXMoKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgRUZJX0FMUkVBRFlfU1RBUlRFRAo+Cj4gSWYgd2UgY3JlYXRlIHRoZSBzYW1lIGRldmljZSBw
YXRoIGZvciB0d28gVVNCIGRldmljZXMsIHRoaXMgaXMgYSBidWcgd2UKPiBtdXN0IGZpeC4KCgpP
SywKCgpzbyB5b3UgY2FuIGZvcmdldCBteSBzZXJpZQoKCj4KPj4KPj4gSW4gY2FzZSBvZiBlcnJv
ciBpbiBwcm9iZSwgdGhlIDJuZCBrZXkgaXMgdW5ib3VuZCBhbmQgZGVhY3RpdmF0ZWQgZm9yCj4+
IHRoZSBuZXh0IHVzYiBjb21tYW5kcyBldmVuIGlmIHRoZSBsaW1pdGF0aW9uIGlzIG9ubHkgZm9y
IEVGSS4KPj4KPj4gVGhpcyBwYXRjaCByZW1vdmVzIGFueSByZXR1cm4gZXJyb3IgaW4gcHJvYmUg
ZXZlbnQgY2FsbGJhY2s7Cj4+IGlmIHNvbWV0aGluZyBvY2N1cnMgaW4gRUZJIHJlZ2lzdHJhdGlv
biwgdGhlIGRldmljZSBpcyBzdGlsbCBwcm9iZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDC
oCBsaWIvZWZpX2xvYWRlci9lZmlfZGlzay5jIHwgMTAgKysrKysrKy0tLQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvbGliL2VmaV9sb2FkZXIvZWZpX2Rpc2suYyBiL2xpYi9lZmlfbG9hZGVyL2VmaV9kaXNrLmMK
Pj4gaW5kZXggZDIyNTY3MTNhOGU3Li44ZDUzYmEzYmQyN2UgMTAwNjQ0Cj4+IC0tLSBhL2xpYi9l
ZmlfbG9hZGVyL2VmaV9kaXNrLmMKPj4gKysrIGIvbGliL2VmaV9sb2FkZXIvZWZpX2Rpc2suYwo+
PiBAQCAtNjc3LDE0ICs2NzcsMTggQEAgaW50IGVmaV9kaXNrX3Byb2JlKHZvaWQgKmN0eCwgc3Ry
dWN0IGV2ZW50ICpldmVudCkKPj4gwqDCoMKgwqDCoCBkZXNjID0gZGV2X2dldF91Y2xhc3NfcGxh
dChkZXYpOwo+PiDCoMKgwqDCoMKgIGlmIChkZXNjLT51Y2xhc3NfaWQgIT0gVUNMQVNTX0VGSV9M
T0FERVIpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGVmaV9kaXNrX2NyZWF0ZV9yYXco
ZGV2LCBhZ2VudF9oYW5kbGUpOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC0xOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkg
ewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dfZXJyKCJlZmlfZGlza19jcmVhdGVfcmF3
ICVzIGZhaWxlZCAoJWQpXG4iLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRl
di0+bmFtZSwgcmV0KTsKPgo+IFRoaXMgaXNuJ3QgYSBtZXNzYWdlIGEgbm9uLWRldmVsb3BlciBj
YW4gZWFzaWx5IHVuZGVyc3RhbmQuCj4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IDA7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgfQo+Pgo+PiDCoMKgwqDCoMKg
IGRldmljZV9mb3JlYWNoX2NoaWxkKGNoaWxkLCBkZXYpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHJldCA9IGVmaV9kaXNrX2NyZWF0ZV9wYXJ0KGNoaWxkLCBhZ2VudF9oYW5kbGUpOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC0xOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dfZXJyKCJlZmlfZGlza19jcmVhdGVf
cGFydCAlcyBmYWlsZWQgKCVkKVxuIiwKPgo+IGRpdHRvLgo+Cj4gQmVzdCByZWdhcmRzCj4KPiBI
ZWlucmljaAo+Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2LT5uYW1lLCBy
ZXQpOwo+PiDCoMKgwqDCoMKgIH0KPj4KPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKCgpQYXRyaWNr
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=
