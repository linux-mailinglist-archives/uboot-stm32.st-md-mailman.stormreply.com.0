Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6AB720729
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Jun 2023 18:12:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9626BC6B443;
	Fri,  2 Jun 2023 16:12:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FB2FC6A617
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 16:12:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352DF1rA010654
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 2 Jun 2023 18:12:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1G2tdC9bAQUjOFK0eD1ndcXg64fMFABeWmySrWlUXZ0=;
 b=l3lkEuU30KR/UY6AuDBi76GwZVM+BWf2olZmZTzEHagm9vYlLf9kxlSo0ZUKaZvq1lFL
 qbdKwmO6wVvWkzmIwEZrEuWwsDE1Cjy/EcsO+drZOTcDXXDv+Odq+LzmDzHEr/j1UbZx
 bpawvYaqX31bvTZmiq81LvB1sgvjmNWCTgjpq2tBOo3L47H1l//RX+NYgxHk4tl1B3gm
 caTh0dHOdsFiO2PXpO+agGAvp5qYzbwiea9pcM1JdEPAjC9ZnT6XCruuhswAWH5HPmnc
 c8HzsTQntjP7fU59bVugvYBtyEvUORFnFTumxF/kfT6awSdd2uzm3W1G6oqzseLko/an Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qx3158ajj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 02 Jun 2023 18:12:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A35510002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 18:12:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6101B252247
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 18:12:54 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 2 Jun
 2023 18:12:53 +0200
Message-ID: <c8f807f2-397f-e1da-2108-e84abe3f543b@foss.st.com>
Date: Fri, 2 Jun 2023 18:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20230602152232.v2.1.I20e8d74ea2ff0a99c6c741846b46af89c4ee136a@changeid>
 <CAOf5uwmhkkh2AUzA2MX+Y3mN8bkui17KOQ7Zsp+A1LwmnYx87Q@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <CAOf5uwmhkkh2AUzA2MX+Y3mN8bkui17KOQ7Zsp+A1LwmnYx87Q@mail.gmail.com>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_12,2023-06-02_02,2023-05-22_02
Subject: Re: [Uboot-stm32] [PATCH v2] dfu: mtd: mark bad the MTD block on
 erase error
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

SGksCgpPbiA2LzIvMjMgMTc6MjcsIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSB3cm90ZToK
PiBIaQo+Cj4gT24gRnJpLCBKdW4gMiwgMjAyMyBhdCAzOjIz4oCvUE0gUGF0cmljayBEZWxhdW5h
eQo+IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPiB3cm90ZToKPj4gSW4gdGhlIE1URCBE
RlUgYmFja2VuZCwgaXQgaXMgbmVlZGVkIHRvIG1hcmsgdGhlIE5BTkQgYmxvY2sgYmFkIHdoZW4g
dGhlCj4+IGVyYXNlIGZhaWxlZCB3aXRoIHRoZSAtRUlPIGVycm9yLCBhcyBpdCBpcyBkb25lIGlu
IFVCSSBhbmQgSkZGUzIgY29kZS4KPj4KPj4gVGhpcyBvcGVyYXRpb24gaXMgbm90IGRvbmUgaW4g
dGhlIE1URCBmcmFtZXdvcmssIGJ1dCB0aGUgYmFkIGJsb2NrCj4+IHRhZyAoaW4gQkJNIG9yIGlu
IEJCVCkgaXMgcmVxdWlyZWQgdG8gYXZvaWQgdG8gd3JpdGUgZGF0YSBvbiB0aGlzIGJsb2NrCj4+
IGluIHRoZSBuZXh0IERGVV9PUF9XUklURSBsb29wIGluIG10ZF9ibG9ja19vcCgpOiB0aGUgY29k
ZSBza2lwIHRoZSBiYWQKPj4gYmxvY2tzLCB0ZXN0ZWQgYnkgbXRkX2Jsb2NrX2lzYmFkKCkuCj4+
Cj4+IFdpdGhvdXQgdGhpcyBwYXRjaCwgd2hlbiB0aGUgTkFORCBibG9jayBiZWNvbWUgYmFkIG9u
IERGVSB3cml0ZSBvcGVyYXRpb24KPj4gLSBsb3cgcHJvYmFiaWxpdHkgb24gbmV3IE5BTkQgLSB0
aGUgREZVIHdyaXRlIG9wZXJhdGlvbiB3aWxsIGFsd2F5cyBmYWlsZWQKPj4gYmVjYXVzZSB0aGUg
ZmFpbGluZyBibG9jayBpcyBuZXZlciBtYXJrZWQgYmFkLgo+Pgo+PiBUaGlzIHBhdGNoIGFsc28g
YWRkcyBhIHRlc3QgdG8gYXZvaWQgdG8gcmVxdWVzdCBhbiBlcmFzZSBvcGVyYXRpb24gb24gYQo+
PiBibG9jayBhbHJlYWR5IG1hcmtlZCBiYWQ7IHRoaXMgdGVzdCBpcyBub3QgcGVyZm9ybWVkIGlu
IE1URCBmcmFtZXdvcmsKPj4gaW4gbXRkX2VyYXNlKCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBh
dHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+
PiBDaGFuZ2VzIGluIHYyOgo+PiAtIGZpeGUgbXRkX2Jsb2NrX2lzYmFkIG9mZnNldCBwYXJhbWV0
ZXIgZm9yIGVyYXNlIGNoZWNrCj4+IC0gQWRkIHRyYWNlIHdoZW4gYmFkIGJsb2NrIGFyZSBza2lw
cGVkIGluIGVyYXNlIGxvb3AKPj4gLSBBZGQgcmVtYWluaW5nIGJ5dGUgaW4gdHJhY2UgIkxpbWl0
IHJlYWNoZWQiCj4+Cj4+ICAgZHJpdmVycy9kZnUvZGZ1X210ZC5jIHwgMzIgKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RmdS9kZnVfbXRk
LmMgYi9kcml2ZXJzL2RmdS9kZnVfbXRkLmMKPj4gaW5kZXggYzcwNzVmMTJlY2E5Li5hNGEzZTkx
YmUyM2UgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZGZ1L2RmdV9tdGQuYwo+PiArKysgYi9kcml2
ZXJzL2RmdS9kZnVfbXRkLmMKPj4gQEAgLTg2LDI3ICs4NiwzOSBAQCBzdGF0aWMgaW50IG10ZF9i
bG9ja19vcChlbnVtIGRmdV9vcCBvcCwgc3RydWN0IGRmdV9lbnRpdHkgKmRmdSwKPj4KPj4gICAg
ICAgICAgICAgICAgICB3aGlsZSAocmVtYWluaW5nKSB7Cj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoZXJhc2Vfb3AuYWRkciArIHJlbWFpbmluZyA+IGxpbSkgewo+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHByaW50ZigiTGltaXQgcmVhY2hlZCAweCVsbHggd2hpbGUg
ZXJhc2luZyBhdCBvZmZzZXQgMHglbGx4XG4iLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBsaW0sIG9mZik7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcHJpbnRmKCJMaW1pdCByZWFjaGVkIDB4JWxseCB3aGlsZSBlcmFzaW5nIGF0IG9mZnNldCAw
eCVsbHgsIHJlbWFpbmluZyAweCVsbHhcbiIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxpbSwgZXJhc2Vfb3AuYWRkciwgcmVtYWluaW5nKTsKPiBUaGlzIGNhbiBi
ZSBpbiBhIGRpZmZlcmVudCBjaGFuZ2UKCgpvawoKCj4KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FSU87Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4+
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qIFNraXAgdGhlIGJsb2NrIGlmIGl0IGlzIGJh
ZCwgZG9uJ3QgZXJhc2UgaXQgYWdhaW4gKi8KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYg
KG10ZF9ibG9ja19pc2JhZChtdGQsIGVyYXNlX29wLmFkZHIpKSB7Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcHJpbnRmKCJTa2lwcGluZyBiYWQgYmxvY2sgYXQgMHglMDhsbHhc
biIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVyYXNlX29wLmFk
ZHIpOwo+IFRoaXMgcHJpbnQgaXMgd3JvbmcuIElmIHJldCBpcyAxIGl0J3MgYSBiYWQgYmxvY2sg
aWYgaXQncyAyIHRoZSBibG9jawo+IGlzIHJlc2VydmVkCgoKT2sKCgpJIGRpZCB0aGUgc2FtZSB0
cmFjZSB0aGFuCgpkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX3V0aWwuYzpuYW5kX2VyYXNlX29w
dHMoKQoKY21kL210ZC5jOmRvX210ZF9iYWQoKQoKCmJ1dCBvbiBvbGQgYnJhbmNoIGJlZm9yZSB5
b3UgY29tbWl0cwoKZDlmYTYxZjU0ZTdmOWEgKCJtdGQ6IG5hbmQ6IFNob3cgcmVzZXJ2ZWQgYmxv
Y2sgaW4gY2hpcC5lcmFzZSIpCgpjZmI4MmY3YzEyM2U0ICgibXRkOiBuYW5kOiBNYXJrIHJlc2Vy
dmVkIGJsb2NrcyIpCgoKdGhhbmtzIHRvIHBvaW50IGl0LCBJIHByZXBhcmUgYSBWMwoKCj4KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlcmFzZV9vcC5hZGRyICs9IG10ZC0+ZXJh
c2VzaXplOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICB9Cj4+ICsKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
IHJldCA9IG10ZF9lcmFzZShtdGQsICZlcmFzZV9vcCk7Cj4+Cj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAocmV0KSB7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyog
QWJvcnQgaWYgaXRzIG5vdCBhIGJhZCBibG9jayBlcnJvciAqLwo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChyZXQgIT0gLUVJTykgewo+PiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcHJpbnRmKCJGYWlsdXJlIHdoaWxlIGVyYXNpbmcgYXQgb2Zm
c2V0IDB4JWxseFxuIiwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBlcmFzZV9vcC5mYWlsX2FkZHIpOwo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLyogSWYgdGhpcyBpcyBub3QgLUVJTywgd2UgaGF2ZSBubyBpZGVhIHdoYXQgdG8gZG8uICov
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA9PSAtRUlPKSB7Cj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmludGYoIk1hcmtpbmcg
YmFkIGJsb2NrIGF0IDB4JTA4bGx4ICglZClcbiIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZXJhc2Vfb3AuZmFpbF9hZGRyLCByZXQpOwo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gbXRkX2Jsb2NrX21hcmti
YWQobXRkLCBlcmFzZV9vcC5hZGRyKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB9Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogQWJvcnQgaWYgaXQgaXMg
bm90IC1FSU8gb3IgY2FuJ3QgbWFyayBiYWQgKi8KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAocmV0KSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwcmludGYoIkZhaWx1cmUgd2hpbGUgZXJhc2luZyBhdCBvZmZzZXQgMHglbGx4ICglZClc
biIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXJh
c2Vfb3AuZmFpbF9hZGRyLCByZXQpOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaW50ZigiU2tpcHBpbmcgYmFk
IGJsb2NrIGF0IDB4JTA4bGx4XG4iLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBlcmFzZV9vcC5hZGRyKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIH0gZWxz
ZSB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbWFpbmluZyAtPSBtdGQt
PmVyYXNlc2l6ZTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIH0KPj4KPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgLyogQ29udGludWUgZXJhc2UgYmVoaW5kIGJhZCBibG9jayAqLwo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAvKiBDb250aW51ZSBlcmFzZSBiZWhpbmQgdGhlIGN1cnJl
bnQgYmxvY2sgKi8KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGVyYXNlX29wLmFkZHIgKz0g
bXRkLT5lcmFzZXNpemU7Cj4+ICAgICAgICAgICAgICAgICAgfQo+PiAgICAgICAgICB9Cj4gT3Ro
ZXJ3aXNlCj4gUmV2aWV3ZWQtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgo+Cj4+IC0tCj4+IDIuMjUuMQo+Pgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0Cj4g
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IGh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
