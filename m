Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE7D5BD161
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Sep 2022 17:46:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4960C03FD5;
	Mon, 19 Sep 2022 15:46:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE2C7C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 15:46:36 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JDd23w004671;
 Mon, 19 Sep 2022 17:46:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=CdXtCbMjn8XkKspvgx7yW2P1oQm5h67dlq6gvGxJftc=;
 b=I2W9o1YXr6TOfjZ5XJIZzMJy+x5Y2LoLmOA/X/ew1/61Z6LIOhglVBpXoHPVevgPq2SQ
 KBOBGQv27m2UfpSLiXdM9g72MVkyWpilNUXGoVrEqg8Z6ig6j4AMwak+54o6E5sTVwE+
 g22mKVO34iiFlrHL+e0Y0eGUwTzugHkJrgMdPjZ+dNBbsZ955ug1Oroj9OQY3ILjtb6A
 /bai7s0/BHJhgoPpa3/q54yvYhawNzB+PzPQG97TcVNRWPWNZI4+TvrMmc8i9QLdfCDT
 d5opBICTjJZthR7ExCgJLSofJ8TUSDw2EWEG4Y5Z/2a0+LWyFp6iuzDb4yyOYrxzaBy1 hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6atkw6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 17:46:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C92B10002A;
 Mon, 19 Sep 2022 17:46:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4396023C6A4;
 Mon, 19 Sep 2022 17:46:34 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.47) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 17:46:33 +0200
Message-ID: <5b7c20fd-f99b-5b3c-42ed-b74551442c09@foss.st.com>
Date: Mon, 19 Sep 2022 17:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
References: <20220909160627.1793406-1-alain.volmat@foss.st.com>
 <20220909160627.1793406-4-alain.volmat@foss.st.com>
 <ab83ad30-4cf2-8c6d-81ad-9edb47d646a2@foss.st.com>
 <20220912083520.GA168503@trex>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220912083520.GA168503@trex>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
Cc: u-boot@lists.denx.de, oleksandr.suvorov@foundries.io,
 uboot-stm32@st-md-mailman.stormreply.com, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] i2c: stm32: do not set the STOP
	condition on error
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

SGkgSm9yZ2UsCgpPbiA5LzEyLzIyIDEwOjM1LCBKb3JnZSBSYW1pcmV6LU9ydGl6LCBGb3VuZHJp
ZXMgd3JvdGU6Cj4gT24gMTIvMDkvMjIsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+IEhpIEFs
YWluLAo+Pgo+PiBPbiA5LzkvMjIgMTg6MDYsIEFsYWluIFZvbG1hdCB3cm90ZToKPj4+IEN1cnJl
bnQgZnVuY3Rpb24gc3RtMzJfaTJjX21lc3NhZ2VfeGZlciBpcyBzZW5kaW5nIGEgU1RPUAo+Pj4g
d2hhdGV2ZXIgdGhlIHJlc3VsdCBvZiB0aGUgdHJhbnNhY3Rpb24gaXMuICBUaGlzIGNhbiBjYXVz
ZSBpc3N1ZXMKPj4+IHN1Y2ggYXMgbWFraW5nIHRoZSBidXMgYnVzeSBzaW5jZSB0aGUgY29udHJv
bGxlciBpdHNlbGYgaXMgYWxyZWFkeQo+Pj4gc2VuZGluZyBhdXRvbWF0aWNhbGx5IGEgU1RPUCB3
aGVuIGEgTkFDSyBpcyBnZW5lcmF0ZWQuCj4+Pgo+Pj4gVGhhbmtzIHRvIEpvcmdlIFJhbWlyZXot
T3J0aXogZm9yIGRpYWdub3NpbmcgYW5kIHByb3Bvc2luZyBhIGZpcnN0Cj4+PiBmaXggZm9yIHRo
aXMuIFsxXQo+Pj4KPj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy91LWJvb3QvMjAyMjA4
MTUxNDUyMTEuMzEzNDItMi1qb3JnZUBmb3VuZHJpZXMuaW8vCj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6
IEpvcmdlIFJhbWlyZXotT3J0aXosIEZvdW5kcmllcyA8am9yZ2VAZm91bmRyaWVzLmlvPgo+Pj4g
U2lnbmVkLW9mZi1ieTogSm9yZ2UgUmFtaXJlei1PcnRpeiA8am9yZ2VAZm91bmRyaWVzLmlvPgo+
Pj4gU2lnbmVkLW9mZi1ieTogQWxhaW4gVm9sbWF0IDxhbGFpbi52b2xtYXRAZm9zcy5zdC5jb20+
Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvaTJjL3N0bTMyZjdfaTJjLmMgfCA2ICsrKy0tLQo+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvc3RtMzJmN19pMmMuYyBiL2RyaXZlcnMvaTJjL3N0
bTMyZjdfaTJjLmMKPj4+IGluZGV4IDBlYzY3YjVjMTIuLjJkYjdmNDRkNDQgMTAwNjQ0Cj4+PiAt
LS0gYS9kcml2ZXJzL2kyYy9zdG0zMmY3X2kyYy5jCj4+PiArKysgYi9kcml2ZXJzL2kyYy9zdG0z
MmY3X2kyYy5jCj4+PiBAQCAtNDgzLDkgKzQ4Myw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfaTJjX21l
c3NhZ2VfeGZlcihzdHJ1Y3Qgc3RtMzJfaTJjX3ByaXYgKmkyY19wcml2LAo+Pj4gICAgCQl9Cj4+
PiAgICAJfQo+Pj4gLQkvKiBFbmQgb2YgdHJhbnNmZXIsIHNlbmQgc3RvcCBjb25kaXRpb24gKi8K
Pj4+IC0JbWFzayA9IFNUTTMyX0kyQ19DUjJfU1RPUDsKPj4+IC0Jc2V0Yml0c19sZTMyKCZyZWdz
LT5jcjIsIG1hc2spOwo+Pj4gKwkvKiBFbmQgb2YgdHJhbnNmZXIsIHNlbmQgc3RvcCBjb25kaXRp
b24gaWYgYXBwcm9wcmlhdGUgKi8KPj4+ICsJaWYgKCFyZXQgJiYgIShzdGF0dXMgJiAoU1RNMzJf
STJDX0lTUl9OQUNLRiB8IFNUTTMyX0kyQ19JU1JfRVJST1JTKSkpCj4+PiArCQlzZXRiaXRzX2xl
MzIoJnJlZ3MtPmNyMiwgU1RNMzJfSTJDX0NSMl9TVE9QKTsKPj4+ICAgIAlyZXR1cm4gc3RtMzJf
aTJjX2NoZWNrX2VuZF9vZl9tZXNzYWdlKGkyY19wcml2KTsKPj4+ICAgIH0KPj4KPj4KPj4gUmV2
aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+
Cj4+IFRlc3RlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0
LmNvbT4gW3N0bTMybXAxNTdjLWRrMl0KPj4KPj4gTm8gcmVncmVzc2lvbiBkZXRlY3Rpb24gb24g
U1QgTWljcm9lbGVjdG9uaWNzIGJvYXJkLgo+Pgo+PiAtIE5vIGVycm9yIHRyYWNlIG9uIGJvb3QK
Pj4KPj4gLSBJMkMgcHJvYmUgY29tbWFuZCBpcyBPSwo+Pgo+PiAgwqAgU1RNMzJNUD4gaTJjIHBy
b2JlCj4+ICDCoCBWYWxpZCBjaGlwIGFkZHJlc3NlczogMjggMzMKPj4KPj4gLSBBbmQgb3RoZXIg
dGVzdHMgZG9uZSB3aXRoIHRoZSAyIEkyQyBkZXZpY2VzIFNUUE1JQzEgJiBTVFVTQjE2MDAgYXJl
IG9rOgo+PiAgwqAgcmVndWxhbG9yIGNvbW1hbmQKPj4KPj4gIMKgIHBtaWMgc3RhdHVzIGNvbW1h
bmQKPj4KPj4gIMKgIFVTQiB0eXBlIEMgY29ubmVjdGlvbi9kZWNvbm5lY3Rpb24KPj4KPj4KPj4g
QEpvcmdlOiBjYW4geW91IHRlc3QgYWxzbyBmb3IgeW91ciB1c2UtY2FzZSwgdGhhbmtzCj4geWVz
IEkgZGlkIHRlc3QgYSBmZXcgaG91cnMgYWdvIGFuZCBpdCBpcyBnb29kIG9uIG15IGVuZC4KPiBj
YW4gYWRkIG15IHRlc3RlZCB0YWcgaWYgbmVlZGVkCj4KPiBUZXN0ZWQtYnk6IEpvcmdlIFJhbWly
ZXotT3J0aXogPGpvcmdlQGZvdW5kcmllcy5pbz4KCgpUaGFua3MgZm9yIHRoZSB0ZXN0CgpidXQg
c29ycnkgSSBkb24ndCBzZWUgeW91ciBtZXNzYWdlIHdoZW4gSSBtYWRlIG15IHB1bGwgcmVxdWVz
dCBmb3IgCnYyMDIyLjEwLXJjNQoKc28gSSBkb24ndCBhZGQgeW91ciB0YWcgIlRlc3RlZC1ieSIg
d2hlbiBJIG1lcmdlIHRoaXMgY29tbWl0IGluIHNlcmllIFY0LgoKCj4gYnR3IEkgYWxzbyBzZW50
IGEgcGF0Y2ggdG8gZml4IHRoZSB3YXkgc29tZSBkdHMgcHJvcGVydGllcyBhcmUgaGFuZGxlZC4K
PiBzaGFsbCBJIHN1Ym1pdCBzZXBhcmF0ZWx5IG9yIHdpbGwgaXQgYmUgaW5jbHVkZWVkIGluIHRo
aXMgc2V0PwoKWWVzIHB1c2hlZCBieSBBbGFpbiBpbiBWNCA9IApodHRwOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC91Ym9vdC9saXN0Lz9zZXJpZXM9MzE3OTQwJnN0YXRlPSoKClNlZVt2
NCw0LzRdIGkyYzogc3RtMzI6IGZpeCB1c2FnZSBvZiByaXNlL2ZhbGwgZGV2aWNlIHRyZWUgcHJv
cGVydGllcwoKaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3QvcGF0Y2gv
MjAyMjA5MTIwODQyMDEuMTgyNjk3OS01LWFsYWluLnZvbG1hdEBmb3NzLnN0LmNvbS8KCml0IGlz
IHBhcnQgb2YgbXkgbGFzdCBwdWxsIHJlcXVlc3QgPSB1LWJvb3Qtc3RtMzItMjAyMjA5MTUKCml0
IGlzIG5vdyBtZXJnZWQgaW4gbWFzdGVyIGJyYW5jaCBhbmQgcGFydCBvZiB0aGUgbmV4dCB2MjAy
Mi4xMC1yYzUKClRoYW5rcwpQYXRyaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
