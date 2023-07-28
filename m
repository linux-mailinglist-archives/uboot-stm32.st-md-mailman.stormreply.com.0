Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C57668B1
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jul 2023 11:22:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E44E2C6B465;
	Fri, 28 Jul 2023 09:21:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FDEBC6B45D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 09:21:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36S96Wut026232; Fri, 28 Jul 2023 11:21:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=US+gTW2q0WFi6JiOnFg9M6IBYSBMBKfg56rvmFRTJAE=;
 b=gBWnjiqaUzMJBg+zSJI8mUEuHe7w5SeM2lkEHIdFz1gwIyHu3wABt/merFW3G/vACcXa
 ckDICM4joXcQbdxYQIfZfN9pmCtQsKEwnmy9226BU30JkmBIA9z1N9/yRfl08QqqtWBJ
 10M3Q9CBydXobV5IRmEPfMzUqKlZAUleUEOpWAoucXCRLnz7Vrc2P92/36lLD8g36B1R
 SnIPQ5B44rpLDCg7VSShefs/UknTvyEzPEzOSrR7xFKRv6493o+8ROrNTIwO4I6/T+0m
 OGi5giz1mSbZ2fTd7y6RcsMrVxiQoaV3VWZJRqWS8YiCiUwQSg7cUY3VfNDngxtL0YqV vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s4armg36b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 11:21:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 615FC10002A;
 Fri, 28 Jul 2023 11:21:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4267B25AEEC;
 Fri, 28 Jul 2023 11:21:48 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 28 Jul
 2023 11:21:47 +0200
Message-ID: <902e5162-e58d-ab35-cf14-021e020ac4d0@foss.st.com>
Date: Fri, 28 Jul 2023 11:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230726224537.360161-1-marex@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230726224537.360161-1-marex@denx.de>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com,
 gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Switch DWMAC RMII clock
	to MCO2 on DHCOM
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

SGksCgpPbiA3LzI3LzIzIDAwOjQ1LCBNYXJlayBWYXN1dCB3cm90ZToKPiBUaGUgREhDT00gU29N
IGhhcyB0d28gb3B0aW9ucyBmb3Igc3VwcGx5aW5nIEVUSFJYIGNsb2NrIHRvIHRoZSBEV01BQwo+
IGJsb2NrIGFuZCBQSFkuIEVpdGhlciAoMSkgRVRIQ0tfSyBnZW5lcmF0ZXMgNTAgTUh6IGNsb2Nr
IG9uIEVUSF9DTEsKPiBwYWQgZm9yIHRoZSBQSFkgYW5kIHRoZSBzYW1lIDUwIE1IeiBjbG9jayBh
cmUgZmVkIGJhY2sgdG8gRVRIUlggdmlhCj4gaW50ZXJuYWwgZXRoX2Nsa19mYiBjbG9jayBjb25u
ZWN0aW9uIE9SICgyKSBFVEhfQ0xLIGlzIG5vdCB1c2VkIGF0Cj4gYWxsLCBNQ08yIGdlbmVyYXRl
cyA1MCBNSHogY2xvY2sgb24gTUNPMiBvdXRwdXQgcGFkIGZvciB0aGUgUEhZIGFuZAo+IHRoZSBz
YW1lIE1DTzIgY2xvY2sgYXJlIGZlZCBiYWNrIGludG8gRVRIUlggdmlhIEVUSF9SWF9DTEsgaW5w
dXQgcGFkCj4gdXNpbmcgZXh0ZXJuYWwgcGFkLXRvLXBhZCBjb25uZWN0aW9uLgo+Cj4gT3B0aW9u
ICgxKSBoYXMgdHdvIGRvd25zaWRlcy4gRVRIQ0tfSyBpcyBzdXBwbGllZCBkaXJlY3RseSBmcm9t
IGVpdGhlcgo+IFBMTDNfUSBvciBQTEw0X1AsIGhlbmNlIHRoZSBQTEwgb3V0cHV0IGlzIGxpbWl0
ZWQgdG8gZXhhY3RseSA1MCBNSHogYW5kCj4gc2luY2UgdGhlIHNhbWUgUExMIG91dHB1dCBpcyBh
bHNvIHVzZWQgdG8gc3VwcGx5IFNETU1DIGJsb2NrcywgdGhlCj4gcGVyZm9ybWFuY2Ugb2YgU0Qg
YW5kIGVNTUMgYWNjZXNzIGlzIGFmZmVjdGVkLiBUaGUgc2Vjb25kIGRvd25zaWRlIGlzCj4gdGhh
dCB1c2luZyB0aGlzIG9wdGlvbiwgdGhlIEVNSSBvZiB0aGUgU29NIGlzIGhpZ2hlci4KPgo+IE9w
dGlvbiAoMikgc29sdmVzIGJvdGggb2YgdGhvc2UgcHJvYmxlbXMsIHNvIGltcGxlbWVudCBpdCBo
ZXJlLiBJbiB0aGlzCj4gY2FzZSwgdGhlIFBMTDRfUCBpcyBubyBsb25nZXIgbGltaXRlZCBhbmQg
Y2FuIGJlIG9wZXJhdGVkIGZhc3RlciwgYXQKPiAxMDAgTUh6LCB3aGljaCBpbXByb3ZlcyBTRE1N
QyBwZXJmb3JtYW5jZSAocmVhZCBwZXJmb3JtYW5jZSBpcyBpbXByb3ZlZAo+IGZyb20gfjQxIE1p
Qi9zIHRvIH41NyBNaUIvcyB3aXRoIGRkIGlmPS9kZXYvbW1jYmxrMSBvZj0vZGV2L251bGwgYnM9
NjRNCj4gY291bnQ9MSkuIFRoZSBFTUkgaW50ZXJmZXJlbmNlIGFsc28gZGVjcmVhc2VzLgo+Cj4g
UG9ydGVkIGZyb20gTGludXgga2VybmVsIGNvbW1pdAo+IDczYWI5OWFhZDUwY2QgKCJBUk06IGR0
czogc3RtMzI6IFN3aXRjaCBEV01BQyBSTUlJIGNsb2NrIHRvIE1DTzIgb24gREhDT00iKQo+Cj4g
U2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gLS0tCj4gQ2M6IFBh
dHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IENjOiBQYXRyaWNr
IERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IENjOiB1LWJvb3RAZGgt
ZWxlY3Ryb25pY3MuY29tCj4gQ2M6IHVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KPiAtLS0KPiAgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzaSB8
IDIyICsrKysrKysrKysrKysrKysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0z
Mm1wMTV4eC1kaGNvbS1zb20uZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1z
b20uZHRzaQo+IGluZGV4IDgzZTJjODc3MTNmLi4yMzhhNjExMTkyZSAxMDA2NDQKPiAtLS0gYS9h
cmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20tc29tLmR0c2kKPiArKysgYi9hcmNoL2FybS9k
dHMvc3RtMzJtcDE1eHgtZGhjb20tc29tLmR0c2kKPiBAQCAtMTE4LDEzICsxMTgsMTIgQEAKPiAg
IAo+ICAgJmV0aGVybmV0MCB7Cj4gICAJc3RhdHVzID0gIm9rYXkiOwo+IC0JcGluY3RybC0wID0g
PCZldGhlcm5ldDBfcm1paV9waW5zX2E+Owo+IC0JcGluY3RybC0xID0gPCZldGhlcm5ldDBfcm1p
aV9zbGVlcF9waW5zX2E+Owo+ICsJcGluY3RybC0wID0gPCZldGhlcm5ldDBfcm1paV9waW5zX2Mg
Jm1jbzJfcGluc19hPjsKPiArCXBpbmN0cmwtMSA9IDwmZXRoZXJuZXQwX3JtaWlfc2xlZXBfcGlu
c19jICZtY28yX3NsZWVwX3BpbnNfYT47Cj4gICAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0Iiwg
InNsZWVwIjsKPiAgIAlwaHktbW9kZSA9ICJybWlpIjsKPiAgIAltYXgtc3BlZWQgPSA8MTAwPjsK
PiAgIAlwaHktaGFuZGxlID0gPCZwaHkwPjsKPiAtCXN0LGV0aC1yZWYtY2xrLXNlbDsKPiAgIAo+
ICAgCW1kaW8wIHsKPiAgIAkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gQEAgLTEzNiw3ICsxMzUs
NyBAQAo+ICAgCQkJLyogTEFOODcxMEFpICovCj4gICAJCQljb21wYXRpYmxlID0gImV0aGVybmV0
LXBoeS1pZDAwMDcuYzBmMCIsCj4gICAJCQkJICAgICAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1j
MjIiOwo+IC0JCQljbG9ja3MgPSA8JnJjYyBFVEhDS19LPjsKPiArCQkJY2xvY2tzID0gPCZyY2Mg
Q0tfTUNPMj47Cj4gICAJCQlyZXNldC1ncGlvcyA9IDwmZ3Bpb2ggMyBHUElPX0FDVElWRV9MT1c+
Owo+ICAgCQkJcmVzZXQtYXNzZXJ0LXVzID0gPDUwMD47Cj4gICAJCQlyZXNldC1kZWFzc2VydC11
cyA9IDw1MDA+Owo+IEBAIC00NDYsNiArNDQ1LDIxIEBACj4gICAJfTsKPiAgIH07Cj4gICAKPiAr
JnJjYyB7Cj4gKwkvKiBDb25uZWN0IE1DTzIgb3V0cHV0IHRvIEVUSF9SWF9DTEsgaW5wdXQgdmlh
IHBhZC1wYWQgY29ubmVjdGlvbiAqLwo+ICsJY2xvY2tzID0gPCZyY2MgQ0tfTUNPMj47Cj4gKwlj
bG9jay1uYW1lcyA9ICJFVEhfUlhfQ0xLL0VUSF9SRUZfQ0xLIjsKPiArCj4gKwkvKgo+ICsJICog
U2V0IFBMTDRQIG91dHB1dCB0byAxMDAgTUh6IHRvIHN1cHBseSBTRE1NQyB3aXRoIGZhc3RlciBj
bG9jaywKPiArCSAqIHNldCBNQ08yIG91dHB1dCB0byA1MCBNSHogdG8gc3VwcGx5IEVUSFJYIGNs
b2NrIHdpdGggUExMNFAvMiwKPiArCSAqIHNvIHRoYXQgTUNPMiBiZWhhdmVzIGFzIGEgZGl2aWRl
ciBmb3IgdGhlIEVUSFJYIGNsb2NrIGhlcmUuCj4gKwkgKi8KPiArCWFzc2lnbmVkLWNsb2NrcyA9
IDwmcmNjIENLX01DTzI+LCA8JnJjYyBQTEw0X1A+Owo+ICsJYXNzaWduZWQtY2xvY2stcGFyZW50
cyA9IDwmcmNjIFBMTDRfUD47Cj4gKwlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDw1MDAwMDAwMD4s
IDwxMDAwMDAwMDA+Owo+ICt9Owo+ICsKPiAgICZybmcxIHsKPiAgIAlzdGF0dXMgPSAib2theSI7
Cj4gICB9OwoKClJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5
QGZvc3Muc3QuY29tPgoKb2sgZm9yIGRldmljZSB0cmVlIGFsaWdubWVudAoKCmJ1dCB0aGlzIE1D
TzIgYXNzaWdubWVudCBpZiBub3QgZnVuY3Rpb25hbCBpbiBVLUJvb3QgY2xvY2sgZHJpdmVyCgot
IHNldF9wYXJlbnQoKSA9PiBpcyBub3QgZGVmaW5lZAoKLSBzZXRfcmF0ZSgpID0+IGlzIG9ubHkg
c3VwcG9ydGVkIGZvciBhIGxpbWl0ZWQgbnVtYmVyIG9mIGNsb2NrLCBQTEw0X1EgCmZvciBleGFt
cGxlCgoKYnV0IE9LIGFzIHRoZSBNQ08yIGlzIGFscmVhZHkgY29uZmlndXJlZCBpbiB0aGUgY2xv
Y2sgdHJlZSBkaXJlY3RseSBpbiAKVS1Cb290IFNQTDoKCi4vYXJjaC9hcm0vZHRzL3N0bTMybXAx
NXh4LWRoY29tLXUtYm9vdC5kdHNpCgomcmNjIHsKIMKgwqAgwqBzdCxjbGtzcmMgPSA8Ci4uLgog
wqDCoCDCoMKgwqDCoCBDTEtfTUNPMl9QTEw0UAogwqDCoCDCoD47CgogwqDCoCDCoHN0LGNsa2Rp
diA9IDwKLi4uCiDCoMKgIMKgwqDCoMKgIDEgLypNQ08yKi8KIMKgwqAgwqA+OwoKClRoYW5rcwpQ
YXRyaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpV
Ym9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby91Ym9vdC1zdG0zMgo=
