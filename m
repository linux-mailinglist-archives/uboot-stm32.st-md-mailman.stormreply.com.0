Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C573C3CD1D1
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jul 2021 12:24:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C323C5719C;
	Mon, 19 Jul 2021 10:24:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 477F0C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 10:24:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JACeJ5027920; Mon, 19 Jul 2021 12:24:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WAolsgLC8+PfBO+GoCognJ7Jj92EUfarg/f9WA7EuUg=;
 b=VlLQze7ASR4lU78P5f9ZbCBfeicQ3HfEmKo0PgVDFKN11UiKvXElDcmyBwQSos80pQTG
 g0TW+xRn5R5lz0TVMvZEz3NF9FPcDujWRthk4qP1utf+tkIqCI7fwKmWwV9otvfQBcL0
 N0HHWWyVfULgnZNRdKChf23EsiFJgdSBhaHg3D6uz9syS/Sy8WRsFIySnQidiG0e7CkP
 5OLvRYVFq0KS6qnsB6oEFybYWNrXlPyQpEzw9QxY51fcjA9xJ5zcr1UOdV7oYFWlZNmM
 joykd7iRqVD6ZhfCKX7PqXqWKsdt2DvdO7WwhVe+4Nw59CRwJfqJBESDNkCR/9Ilmwg0 bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39w4kgh64a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 12:24:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBF07100038;
 Mon, 19 Jul 2021 12:24:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 746CE21D3B2;
 Mon, 19 Jul 2021 12:24:38 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Jul
 2021 12:24:37 +0200
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20210709124630.1.I212e7cd96724368b8272300c59c2a1c1f227ed67@changeid>
 <212af40f-1ae4-007b-d577-9e6cd6e59bef@gmx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <262a41f5-4b0c-fb11-2333-e1e2adf20b0a@foss.st.com>
Date: Mon, 19 Jul 2021 12:24:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <212af40f-1ae4-007b-d577-9e6cd6e59bef@gmx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_02:2021-07-16,
 2021-07-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Alexander Graf <agraf@csgraf.de>
Subject: Re: [Uboot-stm32] [PATCH] efi_loader: replace
 board_get_usable_ram_top by gd->ram_top
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

SGkgSGVpbnJpY2gKCk9uIDcvMTgvMjEgOToyOSBBTSwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90
ZToKPgo+Cj4gT24gNy85LzIxIDEyOjQ2IFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBB
cyBnZC0+cmFtX3RvcCA9IGJvYXJkX2dldF91c2FibGVfcmFtX3RvcCgpIGluIGJvYXJkX3IKPj4g
dGhlIEVGSSBsb2FkZXIgZG9uJ3QgbmVlZCB0byBjYWxsIHRoaXMgZnVuY3Rpb24gYWdhaW4gYW5k
IGFmdGVyIAo+PiByZWxvY2F0aW9uLgo+Pgo+PiBUaGlzIHBhdGNoIGF2b2lkIGlzc3VlIGlmIGJv
YXJkIGFzc3VtZWQgdGhhdCB0aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZAo+PiBvbmx5IG9uZSB0aW1l
IGFuZCBiZWZvcmUgcmVsb2NhdGlvbi4KPgo+IEhlbGxvIFBhdHJpY2ssCj4KPiBXaGljaCBpbXBs
ZW1lbnRhdGlvbiBvZiBib2FyZF9nZXRfdXNhYmxlX3JhbV90b3AoKSBhc3N1bWVzIHRoYXQgaXQg
aXMKPiBjYWxsZWQgb25seSBvbmNlIGJlZm9yZSByZWxvY2F0aW9uPyBQbGVhc2UsIG1lbnRpb24g
dGhpcyBpbiB0aGUgY29tbWl0Cj4gbWVzc2FnZS4KPgpJIHNlZSB0aGUgaXNzdWUgb2NjdXIgaW4g
c3RtMzJtcCBwbGF0Zm9ybSwgaW4gCmFyY2gvYXJtL21hY2gtc3RtMzJtcC9kcmFtX2luaXQuYwoK
SSBtYWRlIHNvbWUgdHJlYXRtZW50IGluIHRoaXMgZnVuY3Rpb24gPSBwYXJzaW5nIG9mIGRldmlj
ZSB0cmVlIHRvIGZvdW5kIHRoZQoKcmVzZXJ2ZWQgbWVtb3J5IC0gcmVzZXJ2ZWQgZm9yIE9QLVRF
RSAtIGFuZCBjYWNoZSBhdHRyaWJ1dGUgdXBkYXRlLgoKCkJlZm9yZSB0aGUgY29tbWl0IDdkYzYw
NjhmYzEwZCAoInN0bTMybXA6IEluY3JlYXNlIHRoZSByZXNlcnZlZCBtZW1vcnkgaW4KCmJvYXJk
X2dldF91c2FibGVfcmFtX3RvcCIpLCBtbXVfc2V0X3JlZ2lvbl9kY2FjaGVfYmVoYXZpb3VyIHdh
cyBjYWxsZWQKCnVuY29uZGl0aW9uYWxseSwgYW5kIGNhdXNlIGlzc3VlIHdoZW4gdGhlIGJvYXJk
X2dldF91c2FibGVfcmFtX3RvcCgpCgp3YXMgY2FsbGVkIGluIGVmaSBjb2RlIChhZnRlciByZWxv
Y2F0aW9uKQoKClNvIEkgYWxyZWFkeSBjb3JyZWN0IHRoaXMgaXNzdWUgd2l0aCB0aGUgYWRkZWQg
dGVzdDoKCivCoMKgIMKgLyogYmVmb3JlIHJlbG9jYXRpb24sIG1hcmsgdGhlIFUtQm9vdCBtZW1v
cnkgYXMgY2FjaGVhYmxlIGJ5IGRlZmF1bHQgKi8KK8KgwqAgwqBpZiAoIShnZC0+ZmxhZ3MgJiBH
RF9GTEdfUkVMT0MpKQorwqDCoCDCoMKgwqAgwqBtbXVfc2V0X3JlZ2lvbl9kY2FjaGVfYmVoYXZp
b3VyKHJlZywgc2l6ZSwgRENBQ0hFX0RFRkFVTFRfT1BUSU9OKTsKCgpBbmQgSSBwcm9wb3NlIHRo
ZSBwYXRjaCB0byBhdm9pZCBpc3N1ZSBvbiBvdGhlciBwbGF0Zm9ybS4uLgoKCkJ1dCBJIGRvbid0
IGNvcnJlY3RseSBoYW5kbGUgdGhlIGNhc2UgdG90YWxfc2l6ZSA9IDAuLi4uCgoKPiBnZC0+cmFt
X3RvcCBpcyBzZXQgaW4gbXVsdGlwbGUgcGxhY2VzOgo+Cj4gYXJjaC9hcm0vbWFjaC1yb2NrY2hp
cC9zcGwuYzoxNDk6wqDCoMKgwqDCoMKgIGdkLT5yYW1fdG9wID0gZ2QtPnJhbV9iYXNlICsKPiBn
ZXRfZWZmZWN0aXZlX21lbXNpemUoKTsKPiBhcmNoL2FybS9tYWNoLXJvY2tjaGlwL3NwbC5jOjE1
MDogZ2QtPnJhbV90b3AgPQo+IGJvYXJkX2dldF91c2FibGVfcmFtX3RvcChnZC0+cmFtX3NpemUp
OwoKeWVzCgo9PiB2b2lkIGJvYXJkX2luaXRfZih1bG9uZyBkdW1teSkKCj4gYXJjaC9hcm0vY3B1
L2FybXY4L2ZzbC1sYXllcnNjYXBlL3NwbC5jOjExNDogZ2QtPnJhbV90b3AgPQo+IGdkLT5iZC0+
YmlfZHJhbVswXS5zdGFydCArIGdkLT5iZC0+YmlfZHJhbVswXS5zaXplOwo+CnllcwoKPT52b2lk
Ym9hcmRfaW5pdF9mKHVsb25nIGR1bW15KQoKClRoZSBib290aCBjYXNlIGFyZSBvbmx5IGZvciBT
UEwgbm90IGZvciBVLUJvb3QgcHJvcGVyIC4uLgoKd2hlcmUgcmFtX3RvcCBpcyBvbmx5IGhhbmRs
ZSBpbiBjb21tb24vYm9hcmRfZi5jCgoKPiBJIGd1ZXNzIHlvdSByZWZlciB0bzoKPgo+IGNvbW1v
bi9ib2FyZF9mLmM6MzQ1OsKgwqAgZ2QtPnJhbV90b3AgPSBnZC0+cmFtX2Jhc2UgKwo+IGdldF9l
ZmZlY3RpdmVfbWVtc2l6ZSgpOwo+IGNvbW1vbi9ib2FyZF9mLmM6MzQ2OsKgwqAgZ2QtPnJhbV90
b3AgPSAKPiBib2FyZF9nZXRfdXNhYmxlX3JhbV90b3AoZ2QtPm1vbl9sZW4pOwo+CgpZZXMKCmlu
wqAgZmlyc3QgYW5hbHlzaXMsIEkgYXNzdW1lIHRoYXQgdGhlIGNvbXB1dGF0aW9uIGlzIGRvbmUg
b25lIHRpbWUKCmFuZCB3ZSBkb24ndCBoYXZlIHJlYXNvbiB0byBkbyBpdCBhZ2Fpbi4KCgo+IEkg
d291bGQgbm90IGV4cGVjdCBib2FyZF9nZXRfdXNhYmxlX3JhbV90b3AoZ2QtPm1vbl9sZW4pIGFu
ZAo+IGJvYXJkX2dldF91c2FibGVfcmFtX3RvcCgwKSB0byBiZSB0aGUgc2FtZS4gU28sIHBsZWFz
ZSwgZGVzY3JpYmUgaW4geW91cgo+IHBhdGNoIHdoeSB5b3UgYXNzdW1lIHRoYXQgYm9hcmRfZ2V0
X3VzYWJsZV9yYW1fdG9wKGdkLT5tb25fbGVuKSBpcyB0aGUKPiB2YWx1ZSB3ZSBzaG91bGQgdXNl
LgoKCk5vLCBJIGRvbid0IGFzc3VtZSBpdCBzaG91bGQgYmUgdGhlIHNhbWUgdmFsdWUuLi4uCgph
bmQgaXQgc2hvdWwgYmUgdGhlIGNhc2UgZm9yIHN0bTMybXAgYXJjaC4KCgpXaGVuIEkgcHJvcG9z
ZSB0aGUgcGF0Y2gsIEkgZG9uJ3QgdGhpbmsgdGhhdCBib2FyZF9nZXRfdXNhYmxlX3JhbV90b3Ag
c2hvdWxkCgp1c2UsIGV4Y2VwdCB0byBzZWxlY3QgdGhlIFUtQm9vdCByZWxvY2F0aW9uIGFkZHJl
c3MuCgoKQnV0IGFmdGVyIHJlZmxlY3Rpb24gYW5kIGEgb3RoZXIgY2hlY2sgSSBhZ3JlZSB0aGF0
IGZvciBFRkkgcG9pbnQgb2YgCnZpZXcgcmFtX3RvcAoKc2hvdWxkIGJlIHJlc3BlY3RlZCAodG8g
cHJlc2VudCBjb3JyZWN0IG1lbW9yeSBtYXBwaW5nIHRvIGtlcm5sZSkKCmFuZCBpdCBpcyBtb3Jl
IGEgaXNzdWUgaW4gc3RtMzJtcCBwbGF0Zm9ybS4uLgoKCj0+IEkgbmVlZCB0byBzdXBwb3J0IGNv
cnJlY3RseSBib2FyZF9nZXRfdXNhYmxlX3JhbV90b3AoMCkKCgoKPgo+IEJlc3QgcmVnYXJkcwo+
Cj4gSGVpbnJpY2gKPgo+PgoKY29uY2x1c2lvbjogSSBhYmFuZG9uIHRoaXMgcGF0Y2guCgoKUGF0
cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJv
b3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vdWJvb3Qtc3RtMzIK
