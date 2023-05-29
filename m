Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C2B7141CE
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 May 2023 03:59:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD207C6905A;
	Mon, 29 May 2023 01:59:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA614C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 01:58:59 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 23879847BF;
 Mon, 29 May 2023 03:58:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685325539;
 bh=ngeZvZZCYhbmRKI6PH6A0jtW4NTkyq2Ju1AMRomwTFo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m9LNszkkXp4vWu8tlWKuNYl47fzgRhAJlPiEy9ek0YFPtmr16OVOzZmkRlNX/Jtlp
 334kzLdKgXjZxC6V3wW19Zr2iYyA3Ve++N53ngzYFtlOUIjRe6CyvM+qB/Zhxi/Z2P
 7QAWa0dv1VE7saE3/O4CuZ3O3bsuSfWviucYd/b/MfhKUNK/AYUVwwJhCj005WYR05
 ANmuCU7r+PIuMZ630p+yiRB8LvorjEnWsY8oeGd3BRnzRJo2Nu6VaCjzuz1sqhY6TI
 68SAl4bPt1rXHUy/yp2Y4+I5JIH7MnZqMuDYDkXpc/rExrs1g2WitW5S3iMhaiG7UZ
 v6Piwv6cb3xQQ==
Message-ID: <7d71cd1e-f109-64d1-39e9-71fb9015534b@denx.de>
Date: Mon, 29 May 2023 03:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20230511002206.180116-1-marex@denx.de>
 <f30a7447-89e3-c3b3-3b8a-3ff048d0695b@foss.st.com>
 <0a44a562-fe18-c8a5-393a-a526be3ca42d@denx.de>
 <a850167d-bdb1-4b05-0d90-4bc6d5303d8f@foss.st.com>
 <0ee4f382-4c6e-0209-3db9-83d44219c710@denx.de>
 <05d299c9-8e1d-231b-214e-e7dceadf5e76@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <05d299c9-8e1d-231b-214e-e7dceadf5e76@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com, antonio.borneo@foss.st.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add IWDG handling into PSCI
	suspend code
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

T24gNS8yNS8yMyAxMzo1NywgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaQoKSGVsbG8gUGF0
cmljaywKCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyogUGluZyBJV0RHMiBhbmQgQUNLIHByZXRp
bWVyIElSUSAqLwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChpd2RnMl93YWtlKSB7Cj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZWwoSVdER19LUl9SRUxPQURfS0VZLCBTVE0z
Ml9JV0RHMl9CQVNFICsgSVdER19LUik7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3
cml0ZWwoSVdER19FV0NSX0VXSUMsIFNUTTMyX0lXREcyX0JBU0UgKyBJV0RHX0VXQ1IpOwo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4gwqAgwqDCoMKgwqDC
oCB3cml0ZWwoMHgzLCBTVE0zMl9SQ0NfQkFTRSArIFJDQ19NUF9TUkVRQ0xSUik7Cj4+Pj4+PiDC
oMKgwqDCoMKgIGRkcl9zd19zZWxmX3JlZnJlc2hfZXhpdCgpOwo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBS
ZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+
Cj4+Pj4KPj4+PiBJIGZlZWwgbGlrZSBtYXliZSBJIG5lZWQgdG8gd2hhY2sgdGhlIElXREcgYWxz
byBCRUZPUkUgZW50ZXJpbmcgCj4+Pj4gc3VzcGVuZCwgZXhwZWN0IGEgVjIgc2hvcnRseS4KPj4+
Pgo+Pj4+IERvIHlvdSB0aGluayB0aGlzIElXREcgYXBwcm9hY2ggaXMgZmluZSB0byBrZWVwIHRo
ZSBzeXN0ZW0gZnJvbSAKPj4+PiByZWJvb3RpbmcgaW4gc3VzcGVuZCA/IE9yIGRvIHlvdSBzZWUg
YW55IGJldHRlciBvcHRpb24gZm9yIHRoZSBNUDEgPwo+Pj4KPj4+Cj4+PiBJIHRoaW5rIGl0IGlz
IGZpbmUgaWYgeW91IHdhbnQgdG8gaGF2ZSB3YXRjaGRvZyBydW5uaW5nIGluIFNUQU5EQlkgCj4+
PiBldmVuIHRoaXMgcGF0Y2ggZm9yY2UgYSB3YWtldXAuCj4+Pgo+Pj4gYnV0IGlmIElXREcgMSBv
ciAyIHNob3VsZCBiZSBub3QgcnVubmluZyBpbiBTVEFOREJZIChidXQgYWxzbyBmb3IgCj4+PiBT
VE9QKSBmb3IgeW91ciBwcm9kdWN0LAo+Pgo+PiBXaHkgPwo+Pgo+PiBJIHdhbnQgdGhlIHdhdGNo
ZG9nIHRvIG1vbml0b3IgdGhhdCB0aGUgcGxhdGZvcm0gaXMgc3RpbGwgT0ssIGV2ZW4gaW4gCj4+
IHN1c3BlbmQuIEFsc28sIGFzIGZhciBhcyBJIGNhbiB0ZWxsLCBvbmNlIHRoZSBJV0RHIGlzIHN0
YXJ0ZWQsIGl0IAo+PiBjYW5ub3QgYmUgc3RvcHBlZCwgcmlnaHQgPwo+IAo+IAo+IHdpdGhvdXQg
Y2hhbmdlIE9UUCAoc28gd2l0aCB0aGUgZGVmYXVsdCBiZWhhdmlvcikKPiAKPiA9PiB5ZXMgdGhl
IHdhdGNoZG9nIElXREcgaXMgcnVubmluZyB3aXRob3V0IHdheSB0byBzdG9wIGl0LgoKQUNLCgo+
Pj4gaXQgY2FuIGJlIG1hbmFnZWQgZGlyZWN0bHkgYnkgdGhlIGhhcmR3YXJlIHdpdGggT1RQLCB0
byBmcmVlemUgd2F0Y2hkb2cuCj4+Pgo+Pj4gPT4gaXQgaXMgYSBkZWNpc2lvbiBmb3IgZWFjaCBw
cm9kdWN0IG9mIHRoZSBkZXNpcmVkIGJlaGF2aW9yIG9mIHRoZSAKPj4+IElXREcgaW4gbG93IHBv
d2VyIG1vZGUuCj4+Pgo+Pj4KPj4+IFNlZSBSZWYgTWFudWFsOiA0OC4zIElXREcgaW1wbGVtZW50
YXRpb24KPj4+Cj4+PiBUYWJsZSAzMzIuIFNUTTMyTVAxNTd4IElXREcgZmVhdHVyZXMKPj4+Cj4+
PiBPcHRpb24gYnl0ZXMgdG8gY29udHJvbCB0aGUgYWN0aXZpdHkgaW4gU3RhbmRieSBtb2RlICg2
KQo+Pj4KPj4+IDYuIENvbnRyb2xsZWQgdmlhIG9wdGlvbiBieXRlcyBPVFBfSVdERzFfRlpfU1RB
TkRCWSBhbmQgCj4+PiBPVFBfSVdERzJfRlpfU1RBTkRCWSwgcmVzcGVjdGl2ZWx5LCBmb3IgSVdE
RzEgYW5kIElXREcyLgo+Pj4KPj4+IGFuZCBpbsKgVGFibGUxNyA9PiBPVFAgMTggPSBIVzIgYml0
IDUgdG8gOAo+Pgo+PiBJIHNhdyB0aGUgT1RQIGZ1c2VzLCBidXQgSSBkb24ndCB3YW50IHRvIGJs
b3cgdGhlbS4gT3IgaXMgdGhhdCByZWFsbHkgCj4+IHRoZSBzdWdnZXN0aW9uIFNUIHdvdWxkIHBy
b3ZpZGUgZm9yIHN1c3BlbmQvcmVzdW1lLCBibG93IHRoZSBmdXNlcyA/Cj4+Cj4+IChJIHdvbmRl
ciwgd2h5IGlzbid0IHRoZSBsb2dpYyBvZiB0aG9zZSBmdXNlcyBpbnZlcnRlZCB0aGVuLCBpLmUu
IGJ5IAo+PiBkZWZhdWx0IHN0b3AgdGhlIHdhdGNoZG9nIGluIHN1c3BlbmQgQU5EIGJsb3cgZnVz
ZXMgdG8ga2VlcCBpdCBydW5uaW5nIAo+PiBpbiBzdXNwZW5kPykKPiAKPiAKPiBpdCBpcyBhIFNv
QyBkZXNpZ24gY2hvaWNlID0+IHRoZSBkZWZhdWx0IGJlaGF2aW9yIGlzIHdhdGNoZG9nIGlzIHJ1
bm5pbmcgCj4gaW4gc3RhbmRieSBhbmQgc3RvcCwgc28geW91IG5lZWQgdG8gcmVsb2FkIGl0Cj4g
Cj4gVGhhdCBpbXBseSB0aGUgbGltaXQgb2YgdGhlIGR1cmF0aW9uIG9mIG1heCBkdXJhdGlvbiBv
ZiBzdGFuZGJ5IHRvIGF2b2lkIAo+IHJlc2V0Li4uLgo+IAo+IGFuZCB0aGUgdXNhZ2Ugb2YgSVdE
RyBwcmUtdGltZW91dCBpbiB0aGlzIGNhc2UgaXQgYSBnb29kIHBsYWNlIHRvIHdha2V1cCAKPiB0
aGUgU29DCj4gCj4gYW5kIGFkZCBzYW5pdHkgY2hlY2tzIChjaGVjayB0aGUgc3lzdGVtIGlzIHN0
aWxsIHJ1bm5pbmcpIGJlZm9yZSB0byAKPiByZWxvYWQgaXQuCgpPSwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
