Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD1733D4C
	for <lists+uboot-stm32@lfdr.de>; Sat, 17 Jun 2023 02:46:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5CD7C6A61A;
	Sat, 17 Jun 2023 00:46:03 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64FBDC6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 00:46:01 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A32E2862D6;
 Sat, 17 Jun 2023 02:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686962761;
 bh=MfsUOnVmvQz7/xRZJE0Cc67aGj4k0Po1v5shHQQRJBw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KMGfiPlMyMdIonyzr1uY8zmb3dAnXKVhQIaPcXoOX2YYbJuqdu81oMk/pfalX0OB2
 /1IhtTl10B+zpQ/sL84Y2nG3FMOX0u+X4Q4anxcixFpNGOthZGFO2e/VTTZQhCKB1l
 GosyBFFGubXI/aVHJurLdtpe+NXqKIM0Jf+XNNj2lnh/HAKtlPRrUimI+sNhj9p7te
 v6nX0jldiICMaVz3ZjZFq/zYsscsCwI8KHXcP8E+V1WRrS32nP8AgaqVcY3Ua2+6u3
 fOQQvSra4KVe5bntKjEplaZb/UKa5NnzM9iKzSD0fZ0yxsTvrjLbJt0dzq2KCs9Pya
 2W76swYD/GrEw==
Message-ID: <392d5490-1f06-e264-7e0d-cdf77f7301c2@denx.de>
Date: Sat, 17 Jun 2023 02:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20230504195208.4941-1-marex@denx.de>
 <6fa1fdfc-d983-dcb9-7a4c-60055505bc79@foss.st.com>
 <2d510067-6725-0c84-b672-a0a701ac0fcf@denx.de>
 <129fa8f9-d828-eef0-2530-e716a0fc4280@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <129fa8f9-d828-eef0-2530-e716a0fc4280@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Use __section(".data") with
 dot in the section name on DHSOM
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

T24gNi8xNi8yMyAxNDoyMywgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IAo+IE9uIDYvMTYv
MjMgMTQ6MTgsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiA2LzE2LzIzIDEzOjQ2LCBQYXRyaWNl
IENIT1RBUkQgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDUvNC8yMyAyMTo1MiwgTWFyZWsgVmFzdXQg
d3JvdGU6Cj4+Pj4gVGhlIGNvcnJlY3Qgc3BlY2lmaWVyIG9mIHRoZSBzZWN0aW9uIGlzICIuZGF0
YSIgYW5kIG5vdCAiZGF0YSIsCj4+Pj4gdXNlIHRoZSBmb3JtZXIgdG8gcGxhY2UgdGhlIHZhcmlh
YmxlcyBpbiAiLmRhdGEiIHNlY3Rpb24uCj4+Pj4KPj4+PiBGaXhlczogNzMxZmQ1MGUyN2YgKCJB
Uk06IHN0bTMyOiBJbXBsZW1lbnQgYm9hcmQgY29kaW5nIG9uIEFWOTYiKQo+Pj4+IEZpeGVzOiA5
MmNhMGY3NDQ2YyAoIkFSTTogZHRzOiBzdG0zMjogU3luY2hyb25pemUgRERSIHNldHR0aW5ncyBv
biBESCBTb01zIikKPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5k
ZT4KPj4+PiAtLS0KPj4+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9z
cy5zdC5jb20+Cj4+Pj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9z
cy5zdC5jb20+Cj4+Pj4gQ2M6IHUtYm9vdEBkaC1lbGVjdHJvbmljcy5jb20KPj4+PiBDYzogdWJv
b3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+Pj4+IC0tLQo+Pj4+ICDCoCBi
b2FyZC9kaGVsZWN0cm9uaWNzL2RoX3N0bTMybXAxL2JvYXJkLmMgfCA2ICsrKy0tLQo+Pj4+ICDC
oCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Cj4+
Pj4gZGlmZiAtLWdpdCBhL2JvYXJkL2RoZWxlY3Ryb25pY3MvZGhfc3RtMzJtcDEvYm9hcmQuYyBi
L2JvYXJkL2RoZWxlY3Ryb25pY3MvZGhfc3RtMzJtcDEvYm9hcmQuYwo+Pj4+IGluZGV4IGE5YTI5
NjVhMzg2Li5hMGNkZjgzZWE3MSAxMDA2NDQKPj4+PiAtLS0gYS9ib2FyZC9kaGVsZWN0cm9uaWNz
L2RoX3N0bTMybXAxL2JvYXJkLmMKPj4+PiArKysgYi9ib2FyZC9kaGVsZWN0cm9uaWNzL2RoX3N0
bTMybXAxL2JvYXJkLmMKPj4+PiBAQCAtMTg1LDkgKzE4NSw5IEBAIGludCBjaGVja2JvYXJkKHZv
aWQpCj4+Pj4gIMKgIH0KPj4+PiAgwqAgwqAgI2lmZGVmIENPTkZJR19CT0FSRF9FQVJMWV9JTklU
X0YKPj4+PiAtc3RhdGljIHU4IGJyZGNvZGUgX19zZWN0aW9uKCJkYXRhIik7Cj4+Pj4gLXN0YXRp
YyB1OCBkZHIzY29kZSBfX3NlY3Rpb24oImRhdGEiKTsKPj4+PiAtc3RhdGljIHU4IHNvbWNvZGUg
X19zZWN0aW9uKCJkYXRhIik7Cj4+Pj4gK3N0YXRpYyB1OCBicmRjb2RlIF9fc2VjdGlvbigiLmRh
dGEiKTsKPj4+PiArc3RhdGljIHU4IGRkcjNjb2RlIF9fc2VjdGlvbigiLmRhdGEiKTsKPj4+PiAr
c3RhdGljIHU4IHNvbWNvZGUgX19zZWN0aW9uKCIuZGF0YSIpOwo+Pj4+ICDCoCBzdGF0aWMgdTMy
IG9wcF92b2x0YWdlX212IF9fc2VjdGlvbigiLmRhdGEiKTsKPj4+PiAgwqAgwqAgc3RhdGljIHZv
aWQgYm9hcmRfZ2V0X2NvZGluZ19zdHJhcHModm9pZCkKPj4+Cj4+PiBBcHBsaWVkIHRvIHUtYm9v
dC1zdG0vbmV4dAo+Pgo+PiBTaW5jZSB0aGlzIGlzIGEgYnVnZml4LCBzaG91bGQgYmUgZm9yIGN1
cnJlbnQuCj4gCj4gSGkgTWFyZWsKPiAKPiBVbmZvcnR1bmF0ZWx5IHRoZSBwdWxsIHJlcXVlc3Qg
aGFzIGFscmVhZHkgc2VudCB0byB0aGUgbWFpbGluZyBsaXN0IDotKAo+IEkgd2lsbCB0YWtlIGNh
cmUgbmV4dCB0aW1lLgoKQ2FuIHlvdSBzZW5kIGFub3RoZXIgTVIgPwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
