Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4242F524614
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 May 2022 08:46:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9661C03FC3;
	Thu, 12 May 2022 06:46:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EC16C035BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 May 2022 06:46:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24C2TN96023980;
 Thu, 12 May 2022 08:45:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+hnZLOOw9yyVyRt009Qk7FXa0K+EtmLUpYJDeR3f70Q=;
 b=x/jyRI6dXis9yWkihmJThynGDvtq5KsezR3rktm+3ks31TnXSzBcGfZkMBcite6ngHC/
 9Ud2PRPm3mFFY2A8+W+HW2F0uH6ZTLSQ0Ds9+ehGYSH6xnLX82sQaQF9d67jLQDvD/wE
 i5RNvEeGpV1JQ8vVHilVfZ7B6SmRxOYrEnz0+LU7+SKHAkduHyO9dBzrQTxuqLRFbe33
 C1wyAlBRfnCQcHxXvOhnXA+KjOXQXph5U+ShoYFvp7bkc4Fu6a7NucSSxIvUKCijJXy9
 mcrnyaMaasX+mOaPKbWDolTRbJjiEpoAwIz48kYJhTf74GD5THVJp0HJ+cUZxC3HZ//y fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwdw9fs03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 08:45:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28D38100034;
 Thu, 12 May 2022 08:45:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A2C32132CD;
 Thu, 12 May 2022 08:45:29 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 12 May
 2022 08:45:28 +0200
Message-ID: <3269f880-5975-da88-d1d1-30901acc1cdb@foss.st.com>
Date: Thu, 12 May 2022 08:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>, <jagan@amarulasolutions.com>, Tom Rini
 <trini@konsulko.com>
References: <20220330073315.7703-1-patrice.chotard@foss.st.com>
 <3734ffff-de4e-df39-864f-cdd7b56b396d@foss.st.com>
In-Reply-To: <3734ffff-de4e-df39-864f-cdd7b56b396d@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-12_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Anji J <anji.jagarlmudi@nxp.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Pratyush Yadav <p.yadav@ti.com>, Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v4 0/3] spi: spi_flash_probe_bus_cs() rely
 on DT for spi speed and mode
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

SGkgQWxsCgpUaGlzIHY0IGlzIGx5aW5nIG9uIG1haWxpbmcgbGlzdCBzaW5jZSBvbmUgbW9udGgg
YW5kIHdhaXRpbmcgZm9yIGJlaW5nIHJldmlld2VkL21lcmdlZC4KSSBhbSBub3Qgc3VyZSB0aGlz
IHNlcmllcyBpcyBkZWxlZ2F0ZWQgdG8gdGhlIGNvcnJlY3QgcGVvcGxlIChKYWdhbiBUZWtpKS4K
CkFzIHRoaXMgc2VyaWVzIGlzIGZpeGluZyBzcGktZmxhc2ggcGVyZm9ybWFuY2UgaXNzdWUgb24g
c29tZSBwbGF0Zm9ybSAoU1RNMzJNUDEgYXQgbGVhc3QpCml0IHdvdWxkIGJlIGdyZWF0IGlmIHRo
aXMgcGF0Y2hzZXQgd2FzIG1lcmdlZCBmb3IgdjIwMjIuMDcgcmVsZWFzZS4KClRoYW5rcwpQYXRy
aWNlCgoKCk9uIDQvMjcvMjIgMTE6MjEsIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPiBIaSBKYWdh
bgo+IAo+IENvdWxkIHlvdSBoYXZlIGEgbG9vayBhdCB0aGlzIHNlcmllcyA/Cj4gSXQgd291bGQg
YmUgZ3JlYXQgaWYgdGhpcyBzZXJpZXMgY2FuIGJlIG1lcmdlZCBpbiB0aGUgdjIwMjIuMDcKPiAK
PiBUaGFua3MKPiAKPiBQYXRyaWNlCj4gCj4gCj4gT24gMy8zMC8yMiAwOTozMywgUGF0cmljZSBD
aG90YXJkIHdyb3RlOgo+PiBTaW5jZSBjb21taXQgZTJlOTVlNWUyNTQyICgic3BpOiBVcGRhdGUg
c3BlZWQvbW9kZSBvbiBjaGFuZ2UiKQo+PiB3aGVuIGNhbGxpbmcgInNmIHByb2JlIiBvciAiZW52
IHNhdmUiIG9uIFNQSSBmbGFzaCwKPj4gc3BpX3NldF9zcGVlZF9tb2RlKCkgaXMgY2FsbGVkIHR3
aWNlLgo+Pgo+PiBzcGlfZ2V0X2J1c19hbmRfY3MoKQo+PiDCoMKgwqDCoMKgwqAgfC0tPiBzcGlf
Y2xhaW1fYnVzKCkKPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfC0tPiBzcGlfc2V0X3Nw
ZWVkX21vZGUoc3BlZWQgYW5kIG1vZGUgZnJvbSBEVCkKPj4gwqDCoMKgwqDCoMKgIC4uLgo+PiDC
oMKgwqDCoMKgwqAgfC0tPiBzcGlfc2V0X3NwZWVkX21vZGUoZGVmYXVsdCBzcGVlZCBhbmQgbW9k
ZSB2YWx1ZSkKPj4KPj4gVGhlIGZpcnN0IHNwaV9zZXRfc3BlZWRfbW9kZSgpIGNhbGwgaXMgZG9u
ZSB3aXRoIHNwZWVkIGFuZCBtb2RlCj4+IHZhbHVlcyBmcm9tIERULCB3aGVyZWFzIHRoZSBzZWNv
bmQgY2FsbCBpcyBkb25lIHdpdGggc3BlZWQKPj4gYW5kIG1vZGUgc2V0IHRvIGRlZmF1bHQgdmFs
dWUgKHNwZWVkIGlzIHNldCB0byBDT05GSUdfU0ZfREVGQVVMVF9TUEVFRCkKPj4KPj4gVGhpcyBp
cyBhbiBpc3N1ZSBiZWNhdXNlIFNQSSBmbGFzaCBwZXJmb3JtYW5jZSBhcmUgaW1wYWN0ZWQgYnkK
Pj4gdXNpbmcgZGVmYXVsdCBzcGVlZCB3aGljaCBjYW4gYmUgbG93ZXIgdGhhbiB0aGUgb25lIGRl
ZmluZWQgaW4gRFQuCj4+Cj4+IE9uZSBzb2x1dGlvbiBpcyB0byBzZXQgQ09ORklHX1NGX0RFRkFV
TFRfU1BFRUQgdG8gdGhlIHNwZWVkIGRlZmluZWQKPj4gaW4gRFQsIGJ1dCB3ZSBsb29zZSBmbGV4
aWJpbGl0eSBvZmZlcmVkIGJ5IERULgo+Pgo+PiBBbm90aGVyIGlzc3VlIGNhbiBiZSBlbmNvdW50
ZXJlZCB3aXRoIDIgU1BJIGZsYXNoZXMgdXNpbmcgMiBkaWZmZXJlbnQKPj4gc3BlZWRzLiBJbiB0
aGlzIHNwZWNpZmljIGNhc2UgdXNhZ2Ugb2YgQ09ORklHX1NGX0RFRkFVTFRfU1BFRUQgaXMgbm90
Cj4+IGZsZXhpYmxlIGNvbXBhcmVkIHRvIGdldCB0aGUgMiBkaWZmZXJlbnQgc3BlZWRzIGZyb20g
RFQuCj4+Cj4+Cj4+IENoYW5nZXMgaW4gdjQ6Cj4+IMKgwqAgLSBTcGxpdCBwcmV2aW91cyBzZXJp
ZXMgaW4gMyBwYXRjaGVzCj4+IMKgwqAgLSBVcGRhdGUgY29tbWl0IG1lc3NhZ2Ugd2l0aCBhZGRp
dGlvbm5hbCBpbmZvcm1hdGlvbgo+Pgo+PiBDaGFuZ2VzIGluIHYzOgo+PiDCoMKgIC0gVXBkYXRl
IGNvbW1pdCBoZWFkZXIgdG8gcmVmbGVjdCB3aGF0IHRoZSBwYXRjaCByZWFsbHkgZG8uCj4+IMKg
wqAgLSBSZW5hbWUgbGVnYWN5IHNwaV9nZXRfYnVzX2FuZF9jcygpIHRvIF9zcGlfZ2V0X2J1c19h
bmRfY3MoKS4KPj4gwqDCoCAtIE5ldyBzcGlfZ2V0X2J1c19hbmRfY3MoKSByZWx5IG9uIERUIGZv
ciBzcGkgc3BlZWQgYW5kIG1vZGUgdmFsdWVzLgo+PiDCoMKgIC0gc3BpX2ZsYXNoX3Byb2JlX2J1
c19jcygpIHJlbHkgYWxzbyBvbiBEVCBmb3Igc3BpIGFuZCBtb2RlIHZhbHVlcy4KPj4KPj4gQ2hh
bmdlcyBpbiB2MjoKPj4gwqDCoCAtIGFkZCBzcGlfZmxhc2hfcHJvYmVfYnVzX2NzX2RlZmF1bHQo
KSB3aGljaCBjYWxscyBzcGlfZ2V0X2J1c19hbmRfY3MoKQo+PiDCoMKgwqDCoCB3aXRoICJ1c2Vf
ZHQiIHBhcmFtIHNldCB0byB0cnVlLCB3aGVyZWFzIHNwaV9mbGFzaF9wcm9iZV9idXNfY3MoKSBj
YWxscwo+PiDCoMKgwqDCoCBzcGlfZ2V0X2J1c19hbmRfY3MoKSB3aXRoICJ1c2VfZHQiIHBhcmFt
IHNldCB0byB0cnVlLgo+Pgo+PiBQYXRyaWNlIENob3RhcmQgKDMpOgo+PiDCoMKgIHNwaTogc3Bp
LXVjbGFzczogQWRkIG5ldyBzcGlfZ2V0X2J1c19hbmRfY3MoKSBpbXBsZW1lbnRhdGlvbgo+PiDC
oMKgIHNwaTogc3BpX2ZsYXNoX3Byb2JlX2J1c19jcygpIHJlbHkgb24gRFQgZm9yIHNwaSBzcGVl
ZCBhbmQgbW9kZQo+PiDCoMKgIHRlc3Q6IGRtOiBzcGk6IFJlcGxhY2UgX3NwaV9nZXRfYnVzX2Fu
ZF9jcygpIGJ5IHNwaV9nZXRfYnVzX2FuZF9jcygpCj4+IMKgwqDCoMKgIGluIHNvbWUgY2FzZQo+
Pgo+PiDCoCBib2FyZC9DWi5OSUMvdHVycmlzX21veC90dXJyaXNfbW94LmMgfMKgIDYgKy0tCj4+
IMKgIGNtZC9zZi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCAxNSArKysrKy0tCj4+IMKgIGNtZC9zcGkuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLQo+PiDCoCBkcml2
ZXJzL210ZC9zcGkvc2YtdWNsYXNzLmPCoMKgwqDCoMKgwqDCoMKgwqAgfCAzMyArKysrKysrLS0t
LS0tLQo+PiDCoCBkcml2ZXJzL25ldC9mbS9mbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgNCArLQo+PiDCoCBkcml2ZXJzL25ldC9wZmVfZXRoL3BmZV9maXJtd2FyZS5j
wqDCoCB8IDE5ICsrLS0tLS0tCj4+IMKgIGRyaXZlcnMvbmV0L3NuaV9uZXRzZWMuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArLS0KPj4gwqAgZHJpdmVycy9zcGkvc3BpLXVjbGFzcy5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LQo+PiDCoCBkcml2ZXJzL3VzYi9nYWRnZXQvbWF4MzQyMF91ZGMuY8KgwqDCoMKgIHzCoCA0ICst
Cj4+IMKgIGVudi9zZi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDEgLQo+PiDCoCBpbmNsdWRlL3NwaS5owqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE5ICsrKysrKystCj4+IMKgIGluY2x1
ZGUvc3BpX2ZsYXNoLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxIC0K
Pj4gwqAgdGVzdC9kbS9zcGkuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAzMyArKysrKysrLS0tLS0tLQo+PiDCoCAxMyBmaWxlcyBjaGFuZ2VkLCAxMzcg
aW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25zKC0pCj4+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
