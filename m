Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E78439BAE2
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Jun 2021 16:27:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8963C57B69;
	Fri,  4 Jun 2021 14:27:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19485C57B5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jun 2021 14:27:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 154EGoaL001459; Fri, 4 Jun 2021 16:27:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=idEDA1dVOajTueKlkegsRV6sSPPUMYfNlLszujex0W4=;
 b=cir1aY956ej7CU4J/TUjQVi7c55rWr4Ig3gD4i9/laHTsaTrEJK8O41IZ21tOL3eER4S
 yW7od/6EPkTUq9iFNERI9Q90n83O44HDUyLH9u0VihUDfX61Er0qFtbYltBMXndOns2Z
 3IB0jXZjOtjFsOmkD8AM+DC9rDlo4XBjjLxx/ByA/MeM3c6FumL7LVdFyMeKvn3uQKYb
 qQ39CfgIiQ5GkROCEO9+REPQgEbMlkxMKXjMwkdFx92biC4A/8XzXDrXpmICP1g0fDvw
 jhXJ9+xUtDyxP1R/eARRj5nTcMNAXR3NotZvm/v06p/h9jqzM93dGv54HT0OaVYfc9/v 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38yg96267f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 16:27:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C33D10002A;
 Fri,  4 Jun 2021 16:27:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F90D2248D4;
 Fri,  4 Jun 2021 16:27:20 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 16:27:20 +0200
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, <u-boot@lists.denx.de>
References: <20210602155241.1.I567147108d7efaa02a3532cde06cf1d5df59ce38@changeid>
 <a5830e26-8114-622e-0d62-832464c2a3da@gmx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <fa9250f6-83e0-343f-d0c9-98644b93e8d3@foss.st.com>
Date: Fri, 4 Jun 2021 16:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a5830e26-8114-622e-0d62-832464c2a3da@gmx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_08:2021-06-04,
 2021-06-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] doc: usage: man-page for ums command
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

SGkKCk9uIDYvMi8yMSA4OjA2IFBNLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+IE9uIDYv
Mi8yMSAzOjUyIFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBQcm92aWRlIGEgbWFuLXBh
Z2UgZm9yIHRoZSB1bXMgY29tbWFuZCBmb3IgVVNCIE1hc3MgU3RvcmFnZS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4K
Pj4gLS0tCj4+Cj4+IMKgIGRvYy91c2FnZS9pbmRleC5yc3QgfMKgIDEgKwo+PiDCoCBkb2MvdXNh
Z2UvdW1zLnJzdMKgwqAgfCA1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspCj4+IMKgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkb2MvdXNhZ2UvdW1zLnJzdAo+Pgo+PiBkaWZmIC0tZ2l0IGEvZG9j
L3VzYWdlL2luZGV4LnJzdCBiL2RvYy91c2FnZS9pbmRleC5yc3QKPj4gaW5kZXggNDFiMjQ3YmM2
Mi4uMWJhYjZhZTNlOSAxMDA2NDQKPj4gLS0tIGEvZG9jL3VzYWdlL2luZGV4LnJzdAo+PiArKysg
Yi9kb2MvdXNhZ2UvaW5kZXgucnN0Cj4+IEBAIC00MywzICs0Myw0IEBAIFNoZWxsIGNvbW1hbmRz
Cj4+IMKgwqDCoMKgIHNjcDAzCj4+IMKgwqDCoMKgIHNpemUKPj4gwqDCoMKgwqAgdHJ1ZQo+PiAr
wqDCoCB1bXMKPj4gZGlmZiAtLWdpdCBhL2RvYy91c2FnZS91bXMucnN0IGIvZG9jL3VzYWdlL3Vt
cy5yc3QKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uY2YwZTNh
OTQ3OQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2RvYy91c2FnZS91bXMucnN0Cj4+IEBAIC0w
LDAgKzEsNTQgQEAKPj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+PiAr
Cj4+ICt1bXMgY29tbWFuZAo+PiArPT09PT09PT09PT0KPj4gKwo+PiArU3lub3BzaXMKPj4gKy0t
LS0tLS0tCj4+ICsKPj4gKzo6Cj4+ICsKPj4gK8KgwqDCoCA8VVNCX2NvbnRyb2xsZXI+IFs8ZGV2
dHlwZT5dIDxkZXZbOnBhcnRdPgo+PiArCj4+ICtEZXNjcmlwdGlvbgo+PiArLS0tLS0tLS0tLS0K
Pj4gKwo+PiArVXNlIHRoZSBVU0IgTWFzcyBTdG9yYWdlIGNsYXNzIChhbHNvIGtub3duIGFzIFVT
QiBNU0Mgb3IgVU1TKSB0byBtYWtlCj4+ICthY2Nlc3NpYmxlIGEgYmxvY2sgZGV2aWNlIChiYXNl
ZCBvbiBVQ0xBU1NfQkxLKSB0byBhIGhvc3QgY29tcHV0aW5nIAo+PiBkZXZpY2UgYW5kCj4+ICt0
byBlbmFibGUgZmlsZSB0cmFuc2ZlcnMgYmV0d2VlbiB0aGUgaG9zdCBhbmQgdGhlIFUtQm9vdCBk
ZXZpY2UuCj4KPiBUaGFuayB5b3UgZm9yIHdyaXRpbmcgdGhpcyBtYW4tcGFnZS4KPgo+IFVuZm9y
dHVuYXRlbHkgaXQgaXMgc3RpbGwgdW5jbGVhciB0byBtZSBob3cgdG8gdXNlIGl0LiBJcyB0aGlz
IHJlbGF0ZWQKPiB0byBVU0IgT1RHPyBXaGF0IHJlcXVpcmVtZW50cyBoYXZlIHRvIGJlIG1ldCB0
byB1c2UgdGhlIGNvbW1hbmQ/Cj4KCml0IGlzIGxpbmtlZCB0byBVU0IgZ2FkZ2V0IChVU0IgZGV2
aWNlKSwgSSB3aWxsIGNsYXJpZmllZCBpbiBWMgoKCj4+ICsKPj4gK1RoaXMgY29tbWFuZCAidW1z
IiBzdGF5cyBpbiB0aGUgVVNCJ3MgdHJlYXRtZW50IGxvb3AgdW50aWwgdXNlciAKPj4gZW50ZXJz
IEN0cmwtQy4KPj4gKwo+PiArVVNCX2NvbnRyb2xsZXIKPj4gK8KgwqDCoCBVU0IgZGV2aWNlIG51
bWJlcgo+PiArCj4+ICtkZXZ0eXBlCj4+ICvCoMKgwqAgYmxvY2sgZGV2aWNlIGludGVyZmFjZSwg
ZGVmYXVsdHMgdG8gIm1tYyIKPj4gKwo+PiArZGV2Cj4+ICvCoMKgwqAgZGV2aWNlIG51bWJlciBm
b3IgZGV2dHlwZQo+PiArCj4+ICtwYXJ0Cj4+ICvCoMKgwqAgcGFydGl0aW9uIG51bWJlciwgZGVm
YXVsdHMgdG8gMCAoZmlyc3QgcGFydGl0aW9uKQo+PiArCj4+ICtFeGFtcGxlCj4+ICstLS0tLS0t
Cj4+ICsKPj4gKzo6Cj4+ICsKPj4gK8KgwqDCoCA9PiB1bXMgMCBtbWMgMAo+PiArwqDCoMKgID0+
IHVtcyAwIHVzYiAxOjIKPj4gKwo+PiArQ29uZmlndXJhdGlvbgo+PiArLS0tLS0tLS0tLS0tLQo+
PiArCj4+ICtUaGUgdW1zIGNvbW1hbmQgaXMgb25seSBhdmFpbGFibGUgaWYgQ09ORklHX0NNRF9V
U0JfTUFTU19TVE9SQUdFPXkuCj4KPiBUaGUgc3ltYm9sIGRvZXMgbm90IGV2ZW4gZGVwZW5kIG9u
IFVTQiBhbmQgbWFzcyBzdG9yYWdlIGJlaW5nIGVuYWJsZWQuIEkKPiB3b3VsZCBoYXZlIGV4cGVj
dGVkIENPTkZJR19VU0JfR0FER0VUIGFuZCBDT05GSUdfQkxLIGFzIHJlcXVpcmVtZW50cy4KPiBF
aXRoZXIgdGhpcyBkZXNjcmlwdGlvbiBvciBjbWQvS2NvbmZpZyBpcyB3cm9uZy4gSSBzdWdnZXN0
IGJvdGggdG8gYmUKPiB1cGRhdGVkLgo+CnllcyBpdCBpcyBhIGluZGlyZWN0IGRlcGVuZGVuY3kK
Cj0+IGlmIHRoZSBDT05GSUdfVVNCX0dBREdFVCBvciBDT05GSUdfQkxLIGlzIG5vdCBhY3RpdmF0
ZWQgdGhlIHVtcyAKY29tbWFuZCBkb24ndCBjb21waWxlIChvciB3b3JrIEkgZG9uJ3Qgc3VyZSkK
CkNNRF9VU0JfTUFTU19TVE9SQUdFID0+IHNlbGVjdCBVU0JfRlVOQ1RJT05fTUFTU19TVE9SQUdF
ICh3aXRjaCBkZXBlbmRzIApvbiBVU0JfR0FER0VUIC8gVVNCKQoKQ09ORklHX0JMSyA9PiByZXF1
aXJlZCBpbiB1c2JfbWFzc19zdG9yYWdlLmMgKGJsa19kcmVhZC9ibGtfZHdyaXRlKQoKSSB3aWxs
IGFkZCB0aGUgMiBkZXBlbmRlbmNpZXMgaW4gVjIKCmNvbmZpZ0NNRF9VU0JfTUFTU19TVE9SQUdF
CmJvb2wiVU1TIHVzYiBtYXNzIHN0b3JhZ2UiCnNlbGVjdFVTQl9GVU5DVElPTl9NQVNTX1NUT1JB
R0UKKyBkZXBlbmRzIG9uQkxLJiYgVVNCX0dBREdFVApoZWxwClVTQiBtYXNzIHN0b3JhZ2Ugc3Vw
cG9ydAoKCj4gQmVzdCByZWdhcmRzCj4KPiBIZWlucmljaAo+Cj4KKC4uLikKClJlZ2FyZHMKClBh
dHJpY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
