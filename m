Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F1878BA78
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Aug 2023 23:53:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 861C7C6A61D;
	Mon, 28 Aug 2023 21:53:47 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A4E2C6A617
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 21:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1693259613; x=1693864413; i=xypron.glpk@gmx.de;
 bh=zbfkKPrXbOZamF3jpQvJJPDHzfUqLIsvPTI9NueEU+w=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dnkF8XqFEq+m9Ge+OTRvqRqBoC9OlR5pM+j8EfPcr7EpTA76ilGAPFAGBX3otNfYNbwShF1
 3mY8bVv5zje1K5OufnGPwovgiaND6e/6vKOU63Cy6ccogwU6v5EEg2hH6HDxsx9xgvwJsCdef
 sFIiHNxrPxu0ew6ZXMqUfKW1FFUJf1bMp38b24CSgk7nxeY8Bx7XHyDYqWwIUyhTeHeRMsfK3
 i/eKsUofbPa+0Sz5xMe4vOVv9QYgyOhWwh+Pgdha5Twm1j35RonCsMqMfVY22KOSa0YZIOAsG
 yMPGqBjItefYABgGw4QrxhOVdThZP3m0y3bkDKg0ydTAzwWBX0kw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.94] ([62.143.244.162]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Msq24-1phxjB0uWe-00tAHm; Mon, 28
 Aug 2023 23:53:33 +0200
Message-ID: <7eeab958-f231-4639-acca-9f91e4f1ab00@gmx.de>
Date: Mon, 28 Aug 2023 23:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Alexander Graf <agraf@csgraf.de>, Simon Glass <sjg@chromium.org>
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <CAPnjgZ0FrwViFv8xLFSkTtztZQw=hnNprCcHfp39s_jfMHRCgA@mail.gmail.com>
 <eda9f0f0-fc4d-42b6-abbd-749f67ef6b10@csgraf.de>
 <CAPnjgZ376PEfX75eGL6QvmehZ9Kp+5_orhcsKOpr=8rpRKutFA@mail.gmail.com>
 <62403d10-946d-489a-b225-1b1c180b9349@csgraf.de>
 <CAPnjgZ3WCmtw_Gdpf=E8Ed5faH4T7-=yPf6RwcktukQEG-7J8g@mail.gmail.com>
 <c1ddb2af-8f3d-1e6c-cc67-76d16fe6aff5@csgraf.de>
 <CAPnjgZ1Y6aahxRRnY5Tb8N6Uk2TuZViXyBXG_MgMSn7QKt8EXw@mail.gmail.com>
 <3edfc316-bdf4-4d11-b592-2e584f1aabb3@csgraf.de>
 <CAPnjgZ1jMhuw2iqkiy6uEWABSF_4fHiet=-=-9LOMKb7-RGziw@mail.gmail.com>
 <b470fd4e-dab9-4edc-bfe4-1a6591a900f9@csgraf.de>
 <CAPnjgZ2+-ka9hbNnLFVvY6Gv=0TLuxT2fiDE0=WHF=E5Wci0wg@mail.gmail.com>
 <11296797-3d37-413b-9517-2890ae26a9bd@csgraf.de>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <11296797-3d37-413b-9517-2890ae26a9bd@csgraf.de>
X-Provags-ID: V03:K1:vFMe6PI00OJOdBnbARWTUvh1SspaIrQ2K8vAt0dvHXmVp088V5K
 zAGTknpjqQhT5ECcDTjhdTPsVZ0ht9Dfo5cZZlU2Qs0RRZ8RS6eqS/hKI4i9weXaSmrlepC
 2JXDIQq4mUPLeuupqhDDmCK3eiVFdWRnJ8E64hoKVolTo675yl26U2d6qrLvHkPW10WcudY
 65uBNxSOut3Miue3OfsBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f8tJ3u+neI0=;aaWbNWn8nyh0igEiQ3kXwFRMxeY
 T9sPTdKsGyFOmyoBI7C5bmWOr0lwfwg5v7EQmEsenkyhSbgCJQVz8yhfSL/FZrCvhb/0651u6
 DjDK15YBVILFvn0XiYttA/Naqrl9ap05ZgxZlS5yPlKgHNkmsYYg8I/wWxkyl53TlmuytFjCw
 eY9r3/xhaANlmsUOqVvMj3o+YNLW1nLntBC3Q6R3sqg4641KaZULP0urg9BGEZNeT7C1Z4U4m
 XOLlEcweUY4C+UzJxnLlBzTJ2DJlHa7Erz30sj8U6Enm5XktPEauLvsQXX/ytxE3b1mqrjgBk
 EVIC+enxuiVpr3JlcpsehV1Nq1nmoMu8SL40Cg8W43LcuH95F7Da7WxcGX/gJOKg12emwZsEh
 j99kd4m8zfAMQRfmjvThZJwItU64F/TFsL0qgDSEv4v2XqBNpJCY1fzPYE6wq8Q4IR0pQDQx3
 qNDLBz9sBs9fid92lJ/AY39gEM5E5K+k1r9IUv2G0CAoQ2fVYmtl2o24czNv8VsVwdlzO3E3f
 DPtwj0Vi0FMidHeiDvljreX+bfdjBWzKpRGWlnwVbxVxIpWrBGVkv2RvTN7qo7fPM0aOECoZz
 II7dhokY3Xby6BbbRoiecE6QmckPDICQEj7TE/CMxFwK6l1opCqoFR/nVHheKPyeoWlmdMHWN
 H+vGQv3oGdNwJEHO44K4BTvkozY3aARMkVqzxHxsEt2cG8MUg8RKQMvIf9ccqC5i3cHKRunHp
 6Rwxy0M+fjsW6BAit8op6gsW/bYQZkDgv4FSdTnhv1QOAa/uZwicFZzsri3aKhv0srpLNBzAJ
 9o9HnND5jyiWUgNjNNn/62+zqcHVewR6PblPJhRT6WhoH29hAxHc7C7mw5w2fC29S3Pu2VCWL
 sted+yqgn1Gv9eqV0ED5D/P9Ud3AK99kCn9Plm/+qQm0DuR7vwFRzxi8h8GXqQg0tlADVtsWS
 k7Suy0AxPllNc1bxyPFVfZ/ZByU=
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 u-boot@lists.denx.de, Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Anatolij Gustschin <agust@denx.de>,
 Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v5 00/13] Add video damage tracking
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

T24gOC8yOC8yMyAyMjoyNCwgQWxleGFuZGVyIEdyYWYgd3JvdGU6Cj4KPiBPbiAyOC4wOC4yMyAx
OTo1NCwgU2ltb24gR2xhc3Mgd3JvdGU6Cj4+IEhpIEFsZXgsCj4+Cj4+IE9uIFdlZCwgMjMgQXVn
IDIwMjMgYXQgMDI6NTYsIEFsZXhhbmRlciBHcmFmIDxhZ3JhZkBjc2dyYWYuZGU+IHdyb3RlOgo+
Pj4gSGV5IFNpbW9uLAo+Pj4KPj4+IE9uIDIyLjA4LjIzIDIwOjU2LCBTaW1vbiBHbGFzcyB3cm90
ZToKPj4+PiBIaSBBbGV4LAo+Pj4+Cj4+Pj4gT24gVHVlLCAyMiBBdWcgMjAyMyBhdCAwMTo0Nywg
QWxleGFuZGVyIEdyYWYgPGFncmFmQGNzZ3JhZi5kZT4gd3JvdGU6Cj4+Pj4+IE9uIDIyLjA4LjIz
IDAxOjAzLCBTaW1vbiBHbGFzcyB3cm90ZToKPj4+Pj4+IEhpIEFsZXgsCj4+Pj4+Pgo+Pj4+Pj4g
T24gTW9uLCAyMSBBdWcgMjAyMyBhdCAxNjo0MCwgQWxleGFuZGVyIEdyYWYgPGFncmFmQGNzZ3Jh
Zi5kZT4gd3JvdGU6Cj4+Pj4+Pj4gT24gMjIuMDguMjMgMDA6MTAsIFNpbW9uIEdsYXNzIHdyb3Rl
Ogo+Pj4+Pj4+PiBIaSBBbGV4LAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiBNb24sIDIxIEF1ZyAyMDIz
IGF0IDE0OjIwLCBBbGV4YW5kZXIgR3JhZiA8YWdyYWZAY3NncmFmLmRlPgo+Pj4+Pj4+PiB3cm90
ZToKPj4+Pj4+Pj4+IE9uIDIxLjA4LjIzIDIxOjU3LCBTaW1vbiBHbGFzcyB3cm90ZToKPj4+Pj4+
Pj4+PiBIaSBBbGV4LAo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gT24gTW9uLCAyMSBBdWcgMjAyMyBh
dCAxMzozMywgQWxleGFuZGVyIEdyYWYgPGFncmFmQGNzZ3JhZi5kZT4KPj4+Pj4+Pj4+PiB3cm90
ZToKPj4+Pj4+Pj4+Pj4gT24gMjEuMDguMjMgMjE6MTEsIFNpbW9uIEdsYXNzIHdyb3RlOgo+Pj4+
Pj4+Pj4+Pj4gSGkgQWxwZXIsCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gT24gTW9uLCAyMSBB
dWcgMjAyMyBhdCAwNzo1MSwgQWxwZXIgTmViaSBZYXNhawo+Pj4+Pj4+Pj4+Pj4gPGFscGVybmVi
aXlhc2FrQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4gVGhpcyBpcyBhIHJlYmFzZSBv
ZiBBbGV4YW5kZXIgR3JhZidzIHZpZGVvIGRhbWFnZSB0cmFja2luZwo+Pj4+Pj4+Pj4+Pj4+IHNl
cmllcywgd2l0aAo+Pj4+Pj4+Pj4+Pj4+IHNvbWUgdGVzdHMgYW5kIG90aGVyIGNoYW5nZXMuIFRo
ZSBvcmlnaW5hbCBjb3ZlciBsZXR0ZXIgaXMKPj4+Pj4+Pj4+Pj4+PiBhcyBmb2xsb3dzOgo+Pj4+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggc2V0IHNwZWVkcyB1cCBncmFwaGlj
cyBvdXRwdXQgb24gQVJNIGJ5IGEKPj4+Pj4+Pj4+Pj4+Pj4gZmFjdG9yIG9mIDYweC4KPj4+Pj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gT24gbW9zdCBBUk0gU0JDcywgd2Uga2VlcCB0aGUgZnJh
bWUgYnVmZmVyIGluIERSQU0gYW5kIG1hcAo+Pj4+Pj4+Pj4+Pj4+PiBpdCBhcyBjYWNoZWQsCj4+
Pj4+Pj4+Pj4+Pj4+IGJ1dCBuZWVkIGl0IGFjY2Vzc2libGUgYnkgdGhlIGRpc3BsYXkgY29udHJv
bGxlciB3aGljaAo+Pj4+Pj4+Pj4+Pj4+PiByZWFkcyBkaXJlY3RseQo+Pj4+Pj4+Pj4+Pj4+PiBm
cm9tIGEgbGF0ZXIgcG9pbnQgb2YgY29uc2lzdGVuY3kuIEhlbmNlLCB3ZSBmbHVzaCB0aGUKPj4+
Pj4+Pj4+Pj4+Pj4gZnJhbWUgYnVmZmVyIHRvCj4+Pj4+Pj4+Pj4+Pj4+IERSQU0gb24gZXZlcnkg
Y2hhbmdlLiBUaGUgZnVsbCBmcmFtZSBidWZmZXIuCj4+Pj4+Pj4+Pj4+PiBJdCBzaG91bGQgbm90
LCBzZWUgYmVsb3cuCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiBVbmZvcnR1bmF0ZWx5LCB3
aXRoIHRoZSBhZHZlbnQgb2YgNGsgZGlzcGxheXMsIHdlIGFyZQo+Pj4+Pj4+Pj4+Pj4+PiBzZWVp
bmcgZnJhbWUgYnVmZmVycwo+Pj4+Pj4+Pj4+Pj4+PiB0aGF0IGNhbiB0YWtlIGEgd2hpbGUgdG8g
Zmx1c2ggb3V0LiBUaGlzIHdhcyByZXBvcnRlZCBieQo+Pj4+Pj4+Pj4+Pj4+PiBEYSBYdWUgd2l0
aCBncnViLAo+Pj4+Pj4+Pj4+Pj4+PiB3aGljaCBoYXBwaWx5IHByaW50IDEwMDBzIG9mIHNwYWNl
cyBvbiB0aGUgc2NyZWVuIHRvIGRyYXcKPj4+Pj4+Pj4+Pj4+Pj4gYSBtZW51LiBFdmVyeQo+Pj4+
Pj4+Pj4+Pj4+PiBwcmludGVkIHNwYWNlIHRyaWdnZXJzIGEgY2FjaGUgZmx1c2guCj4+Pj4+Pj4+
Pj4+PiBUaGF0IGlzIGEgYnVnIHNvbWV3aGVyZSBpbiBFRkkuCj4+Pj4+Pj4+Pj4+IFVuZm9ydHVu
YXRlbHkgbm90IDopLiBZb3UgbWF5IGNhbGwgaXQgYSBidWcgaW4gZ3J1YjogSXQKPj4+Pj4+Pj4+
Pj4gbGl0ZXJhbGx5IHByaW50cwo+Pj4+Pj4+Pj4+PiBvdmVyIHNwYWNlIGNoYXJhY3RlcnMgZm9y
IGV2ZXJ5IGNoYXJhY3RlciBpbiBpdHMgbWVudSB0aGF0IGl0Cj4+Pj4+Pj4+Pj4+IHdhbnRzCj4+
Pj4+Pj4+Pj4+IGNsZWFyZWQuIE9uIGV2ZXJ5IHRleHQgc2NyZWVuIGRyYXcuCj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+IFRoaXMgd291bGRuJ3QgYmUgYSBiaWcgaXNzdWUgaWYgd2Ugb25seSBmbHVz
aCB0aGUgcmVhY3RhbmdsZQo+Pj4+Pj4+Pj4+PiB0aGF0IGdldHMKPj4+Pj4+Pj4+Pj4gbW9kaWZp
ZWQuIEJ1dCB3aXRob3V0IHRoaXMgcGF0Y2ggc2V0LCB3ZSdyZSBmbHVzaGluZyB0aGUgZnVsbAo+
Pj4+Pj4+Pj4+PiBEUkFNCj4+Pj4+Pj4+Pj4+IGJ1ZmZlciBvbiBldmVyeSB1LWJvb3QgdGV4dCBj
b25zb2xlIGNoYXJhY3RlciB3cml0ZSwgd2hpY2gKPj4+Pj4+Pj4+Pj4gbWVhbnMgZm9yCj4+Pj4+
Pj4+Pj4+IGV2ZXJ5IGNoYXJhY3RlciAoYXMgdGhhdCdzIHRoZSBvbmx5IEFQSSBVRUZJIGhhcyku
Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEFzIGEgbmljZSBzaWRlIGVmZmVjdCwgd2Ugc3BlZWQg
dXAgdGhlIG5vcm1hbCBVLUJvb3QgdGV4dAo+Pj4+Pj4+Pj4+PiBjb25zb2xlIGFzCj4+Pj4+Pj4+
Pj4+IHdlbGwgd2l0aCB0aGlzIHBhdGNoIHNldCwgYmVjYXVzZSBldmVuICJub3JtYWwiIHRleHQg
cHJpbnRzCj4+Pj4+Pj4+Pj4+IHRoYXQgd3JpdGUKPj4+Pj4+Pj4+Pj4gZm9yIGV4YW1wbGUgYSBz
aW5nbGUgbGluZSBvZiB0ZXh0IG9uIHRoZSBzY3JlZW4gdG9kYXkgZmx1c2gKPj4+Pj4+Pj4+Pj4g
dGhlIGZ1bGwKPj4+Pj4+Pj4+Pj4gZnJhbWUgYnVmZmVyIHRvIERSQU0uCj4+Pj4+Pj4+Pj4gTm8s
IEkgbWVhbiB0aGF0IGl0IGlzIGEgYnVnIHRoYXQgVS1Cb290IChhcHBhcmVudGx5KSBmbHVzaGVz
Cj4+Pj4+Pj4+Pj4gdGhlIGNhY2hlCj4+Pj4+Pj4+Pj4gYWZ0ZXIgZXZlcnkgY2hhcmFjdGVyLiBJ
dCBkb2Vzbid0IGRvIHRoYXQgZm9yIG5vcm1hbCBjaGFyYWN0ZXIKPj4+Pj4+Pj4+PiBvdXRwdXQK
Pj4+Pj4+Pj4+PiBhbmQgSSBkb24ndCB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBkbyBpdCBmb3Ig
RUZJIGVpdGhlci4KPj4+Pj4+Pj4+IEkgc2VlLiBMZXQncyB0cmFjZSB0aGUgY2FsbHM6Cj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4gZWZpX2NvdXRfb3V0cHV0X3N0cmluZygpCj4+Pj4+Pj4+PiAtPiBmcHV0
cygpCj4+Pj4+Pj4+PiAtPiB2aWRjb25zb2xlX3B1dHMoKQo+Pj4+Pj4+Pj4gLT4gdmlkZW9fc3lu
YygpCj4+Pj4+Pj4+PiAtPiBmbHVzaF9kY2FjaGVfcmFuZ2UoKQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
IFVuZm9ydHVuYXRlbHkgZ3J1YiBhYnN0cmFjdHMgY2hhcmFjdGVyIGJhY2tlbmRzIGRvd24gdG8g
dGhlICJwcmludAo+Pj4+Pj4+Pj4gY2hhcmFjdGVyIiBsZXZlbCwgc28gaXQgY2FsbHMgVUVGSSdz
IHNvcGlzdGljYXRlZCAib3V0cHV0X3N0cmluZyIKPj4+Pj4+Pj4+IGNhbGxiYWNrIHdpdGggc2lu
Z2xlIGNoYXJhY3RlcnMgYXQgYSB0aW1lLCB3aGljaCBtZWFucyB3ZSBkbyBhCj4+Pj4+Pj4+PiBm
dWxsCj4+Pj4+Pj4+PiBkY2FjaGUgZmx1c2ggZm9yIGV2ZXJ5IGNoYXJhY3RlciB0aGF0IHdlIHBy
aW50Ogo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IGh0dHBzOi8vZ2l0LnNhdmFubmFoLmdudS5vcmcvY2dp
dC9ncnViLmdpdC90cmVlL2dydWItY29yZS90ZXJtL2VmaS9jb25zb2xlLmMjbjE2NQo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggc2V0IGltcGxlbWVudHMgdGhl
IGVhc2llc3QgbWl0aWdhdGlvbiBhZ2FpbnN0Cj4+Pj4+Pj4+Pj4+Pj4+IHRoaXMgcHJvYmxlbToK
Pj4+Pj4+Pj4+Pj4+Pj4gRGFtYWdlIHRyYWNraW5nLiBXZSByZW1lbWJlciB0aGUgbG93ZXN0IGNv
bW1vbiBkZW5vbWluYXRvcgo+Pj4+Pj4+Pj4+Pj4+PiByZWdpb24gdGhhdCB3YXMKPj4+Pj4+Pj4+
Pj4+Pj4gdG91Y2hlZCBzaW5jZSB0aGUgbGFzdCB2aWRlb19zeW5jKCkgY2FsbCBhbmQgb25seSBm
bHVzaAo+Pj4+Pj4+Pj4+Pj4+PiB0aGF0LiBUaGUgbW9zdAo+Pj4+Pj4+Pj4+Pj4+PiB0eXBpY2Fs
IHdyaXRlciB0byB0aGUgZnJhbWUgYnVmZmVyIGlzIHRoZSB2aWRlbyBjb25zb2xlLAo+Pj4+Pj4+
Pj4+Pj4+PiB3aGljaCBhbHdheXMKPj4+Pj4+Pj4+Pj4+Pj4gd3JpdGVzIHJlY3RhbmdsZXMgb2Yg
Y2hhcmFjdGVycyBvbiB0aGUgc2NyZWVuIGFuZCBzeW5jcwo+Pj4+Pj4+Pj4+Pj4+PiBhZnRlcndh
cmRzLgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiBXaXRoIHRoaXMgcGF0Y2ggc2V0IGFw
cGxpZWQsIHdlIHJlZHVjZSBkcmF3aW5nIGEgbGFyZ2UKPj4+Pj4+Pj4+Pj4+Pj4gZ3J1YiBtZW51
ICh3aXRoCj4+Pj4+Pj4+Pj4+Pj4+IHNlcmlhbCBjb25zb2xlIGF0dGFjaGVkIGZvciBzaXplIGlu
Zm9ybWF0aW9uKSBvbiBhbgo+Pj4+Pj4+Pj4+Pj4+PiBSSzMzOTktUk9DIHN5c3RlbQo+Pj4+Pj4+
Pj4+Pj4+PiBhdCAxNDQwcCBmcm9tIDU1IHNlY29uZHMgdG8gbGVzcyB0aGFuIDEgc2Vjb25kLgo+
Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiBWZXJzaW9uIDIgYWxzbyBpbXBsZW1lbnRzIFZJ
REVPX0NPUFkgdXNpbmcgdGhpcyBtZWNoYW5pc20sCj4+Pj4+Pj4+Pj4+Pj4+IHJlZHVjaW5nIGl0
cwo+Pj4+Pj4+Pj4+Pj4+PiBvdmVyaGVhZCBjb21wYXJlZCB0byBiZWZvcmUgYXMgd2VsbC4gU28g
ZXZlbiB4ODYgc3lzdGVtcwo+Pj4+Pj4+Pj4+Pj4+PiBzaG91bGQgYmUgZmFzdGVyCj4+Pj4+Pj4+
Pj4+Pj4+IHdpdGggdGhpcyBub3cgOikuCj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+Pj4+IEFsdGVybmF0aXZlcyBjb25zaWRlcmVkOgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCAxKSBMYXp5IHN5bmMgLSBTYW5kYm94IGRvZXMgdGhp
cy4gSXQgb25seSBjYWxscwo+Pj4+Pj4+Pj4+Pj4+PiB2aWRlb19zeW5jKHRydWUpIGV2ZXIKPj4+
Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgc28gb2Z0ZW4uIFdlIGFyZSBtaXNzaW5n
IHRpbWVycyB0byBkbyB0aGlzCj4+Pj4+Pj4+Pj4+Pj4+IGdlbmVyaWNhbGx5Lgo+Pj4+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCAyKSBEb3VibGUgYnVmZmVyaW5nIC0g
V2UgY291bGQgdHJ5IHRvIGlkZW50aWZ5Cj4+Pj4+Pj4+Pj4+Pj4+IHdoZXRoZXIgYW55dGhpbmcg
Y2hhbmdlZAo+Pj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdCBhbGwgYW5kIG9u
bHkgZHJhdyB0byB0aGUgRkIgaWYgaXQgZGlkLiBUaGF0Cj4+Pj4+Pj4+Pj4+Pj4+IHdvdWxkIHJl
cXVpcmUKPj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFpbnRhaW5pbmcgYSBz
ZWNvbmQgYnVmZmVyIHRoYXQgd2UgbmVlZCB0byBzY2FuLgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCAzKSBUZXh0IGJ1ZmZlciAtIE1haW50YWluIGEgYnVmZmVy
IG9mIGFsbCB0ZXh0Cj4+Pj4+Pj4+Pj4+Pj4+IHByaW50ZWQgb24gdGhlIHNjcmVlbiB3aXRoCj4+
Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc3BlY3RpdmUgbG9jYXRpb24uIERv
bid0IHdyaXRlIGlmIHRoZSBvbGQgYW5kCj4+Pj4+Pj4+Pj4+Pj4+IG5ldyBjaGFyYWN0ZXIgYXJl
Cj4+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlkZW50aWNhbC4gVGhpcyB3b3Vs
ZCBsaW1pdCBhcHBsaWNhYmlsaXR5IHRvCj4+Pj4+Pj4+Pj4+Pj4+IHRleHQgb25seSBhbmQgaXMg
YW4KPj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3B0aW1pemF0aW9uIG9uIHRv
cCBvZiB0aGlzIHBhdGNoIHNldC4KPj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqAgNCkgSGFzaCBzY3JlZW4gbGluZXMgLSBDcmVhdGUgYSBoYXNoIChzaGEyNTY/KQo+
Pj4+Pj4+Pj4+Pj4+PiBvdmVyIGV2ZXJ5IGxpbmUgd2hlbiBpdAo+Pj4+Pj4+Pj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjaGFuZ2VzLiBPbmx5IGZsdXNoIHdoZW4gaXQgZG9lcy4gSSdtIG5v
dCBzdXJlCj4+Pj4+Pj4+Pj4+Pj4+IGlmIHRoaXMgd291bGQgd2FzdGUKPj4+Pj4+Pj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbW9yZSB0aW1lLCBtZW1vcnkgYW5kIGNhY2hlIHRoYW4gdGhl
IGN1cnJlbnQKPj4+Pj4+Pj4+Pj4+Pj4gYXBwcm9hY2guIEl0IHdvdWxkIG1ha2UKPj4+Pj4+Pj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnVsbCBzY3JlZW4gdXBkYXRlcyBtdWNoIG1vcmUg
ZXhwZW5zaXZlLgo+Pj4+Pj4+Pj4+Pj4gNSkgRml4IHRoZSBidWcgbWVudGlvbmVkIGFib3ZlPwo+
Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBDaGFuZ2VzIGluIHY1Ogo+Pj4+Pj4+Pj4+Pj4+IC0g
QWRkIHBhdGNoICJ2aWRlbzogdGVzdDogU3BsaXQgY29weSBmcmFtZSBidWZmZXIgY2hlY2sKPj4+
Pj4+Pj4+Pj4+PiBpbnRvIGEgZnVuY3Rpb24iCj4+Pj4+Pj4+Pj4+Pj4gLSBBZGQgcGF0Y2ggInZp
ZGVvOiB0ZXN0OiBTdXBwb3J0IGNoZWNraW5nIGNvcHkgZnJhbWUKPj4+Pj4+Pj4+Pj4+PiBidWZm
ZXIgY29udGVudHMiCj4+Pj4+Pj4+Pj4+Pj4gLSBBZGQgcGF0Y2ggInZpZGVvOiB0ZXN0OiBUZXN0
IHBhcnRpYWwgdXBkYXRlcyBvZiBoYXJkd2FyZQo+Pj4+Pj4+Pj4+Pj4+IGZyYW1lIGJ1ZmZlciIK
Pj4+Pj4+Pj4+Pj4+PiAtIFVzZSB4c3RhcnQsIHlzdGFydCwgeGVuZCwgeWVuZCBhcyBuYW1lcyBm
b3IgZGFtYWdlIHJlZ2lvbgo+Pj4+Pj4+Pj4+Pj4+IC0gRG9jdW1lbnQgZGFtYWdlIHN0cnVjdCBh
bmQgZmllbGRzIGluIHN0cnVjdCB2aWRlb19wcml2Cj4+Pj4+Pj4+Pj4+Pj4gY29tbWVudAo+Pj4+
Pj4+Pj4+Pj4+IC0gUmV0dXJuIHZvaWQgZnJvbSB2aWRlb19kYW1hZ2UoKQo+Pj4+Pj4+Pj4+Pj4+
IC0gRml4IHVuZGVjbGFyZWQgcHJpdiBlcnJvciBpbiB2aWRlb19zeW5jKCkKPj4+Pj4+Pj4+Pj4+
PiAtIERyb3AgdW51c2VkIGhlYWRlcnMgZnJvbSB2aWRlby11Y2xhc3MuYwo+Pj4+Pj4+Pj4+Pj4+
IC0gVXNlIElTX0VOQUJMRUQoKSBpbnN0ZWFkIG9mIENPTkZJR19JU19FTkFCTEVEKCkKPj4+Pj4+
Pj4+Pj4+PiAtIENhbGwgdmlkZW9fZGFtYWdlKCkgYWxzbyBpbiB2aWRlb19maWxsX3BhcnQoKQo+
Pj4+Pj4+Pj4+Pj4+IC0gVXNlIG1ldC0+YmFzZWxpbmUgaW5zdGVhZCBvZiBwcml2LT5iYXNlbGlu
ZQo+Pj4+Pj4+Pj4+Pj4+IC0gVXNlIGZvbnRkYXRhLT5oZWlnaHQvd2lkdGggaW5zdGVhZCBvZgo+
Pj4+Pj4+Pj4+Pj4+IFZJREVPX0ZPTlRfSEVJR0hUL1dJRFRICj4+Pj4+Pj4+Pj4+Pj4gLSBVcGRh
dGUgY29uc29sZV9yb3RhdGUuYyB2aWRlb19kYW1hZ2UoKSBjYWxscyB0byBwYXNzCj4+Pj4+Pj4+
Pj4+Pj4gdmlkZW8gdGVzdHMKPj4+Pj4+Pj4+Pj4+PiAtIFJlbW92ZSBtZW50aW9uIGFib3V0IG5v
dCBoYXZpbmcgbWluaW1hbCBkYW1hZ2UgZm9yCj4+Pj4+Pj4+Pj4+Pj4gY29uc29sZV9yb3RhdGUu
Ywo+Pj4+Pj4+Pj4+Pj4+IC0gQWRkIHBhdGNoICJ2aWRlbzogdGVzdDogVGVzdCB2aWRlbyBkYW1h
Z2UgdHJhY2tpbmcgdmlhCj4+Pj4+Pj4+Pj4+Pj4gdmlkY29uc29sZSIKPj4+Pj4+Pj4+Pj4+PiAt
IERvY3VtZW50IG5ldyB2ZGV2IGZpZWxkIGluIHN0cnVjdCBlZmlfZ29wX29iaiBjb21tZW50Cj4+
Pj4+Pj4+Pj4+Pj4gLSBSZW1vdmUgdmlkZW9fc3luY19jb3B5KCkgYWxzbyBmcm9tIHZpZGVvX2Zp
bGwoKSwKPj4+Pj4+Pj4+Pj4+PiB2aWRlb19maWxsX3BhcnQoKQo+Pj4+Pj4+Pj4+Pj4+IC0gRml4
IG1lbW1vdmUoKSBjYWxscyBieSByZW1vdmluZyB0aGUgZXh0cmEgZGV2IGFyZ3VtZW50Cj4+Pj4+
Pj4+Pj4+Pj4gLSBDYWxsIHZpZGVvX3N5bmMoKSBiZWZvcmUgY2hlY2tpbmcgY29weV9mYiBpbiB2
aWRlbyB0ZXN0cwo+Pj4+Pj4+Pj4+Pj4+IC0gSW1wbHkgVklERU9fREFNQUdFIGZvciB2aWRlbyBk
cml2ZXJzIGluc3RlYWQgb2Ygc2VsZWN0aW5nIGl0Cj4+Pj4+Pj4+Pj4+Pj4gLSBJbXBseSBWSURF
T19EQU1BR0UgYWxzbyBmb3IgVklERU9fVElEU1MKPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+
IHY0Ogo+Pj4+Pj4+Pj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDEwMzIx
NTAwNC4yMjY0Ni0xLWFncmFmQGNzZ3JhZi5kZS8KPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+
IENoYW5nZXMgaW4gdjQ6Cj4+Pj4+Pj4+Pj4+Pj4gLSBNb3ZlIGRhbWFnZSBjbGVhciB0byBwYXRj
aCAiZG06IHZpZGVvOiBBZGQgZGFtYWdlCj4+Pj4+Pj4+Pj4+Pj4gdHJhY2tpbmcgQVBJIgo+Pj4+
Pj4+Pj4+Pj4+IC0gU2ltcGxpZnkgZmlyc3QgZGFtYWdlIGxvZ2ljCj4+Pj4+Pj4+Pj4+Pj4gLSBS
ZW1vdmUgVklERU9fREFNQUdFIGRlZmF1bHQgZm9yIEFSTQo+Pj4+Pj4+Pj4+Pj4+IC0gU2tpcCBk
YW1hZ2Ugb24gRWZpQmx0VmlkZW9Ub0JsdEJ1ZmZlcgo+Pj4+Pj4+Pj4+Pj4+IC0gQWRkIHBhdGNo
ICJ2aWRlbzogQWx3YXlzIGNvbXBpbGUgY2FjaGUgZmx1c2hpbmcgY29kZSIKPj4+Pj4+Pj4+Pj4+
PiAtIEFkZCBwYXRjaCAidmlkZW86IEVuYWJsZSBWSURFT19EQU1BR0UgZm9yIGRyaXZlcnMgdGhh
dAo+Pj4+Pj4+Pj4+Pj4+IG5lZWQgaXQiCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiB2MzoK
Pj4+Pj4+Pj4+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjEyMzAxOTU4Mjgu
ODgxMzQtMS1hZ3JhZkBjc2dyYWYuZGUvCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBDaGFu
Z2VzIGluIHYzOgo+Pj4+Pj4+Pj4+Pj4+IC0gQWRhcHQgdG8gYWx3YXlzIGFzc3VtZSBETSBpcyB1
c2VkCj4+Pj4+Pj4+Pj4+Pj4gLSBBZGFwdCB0byBhbHdheXMgYXNzdW1lIERNIGlzIHVzZWQKPj4+
Pj4+Pj4+Pj4+PiAtIE1ha2UgVklERU9fQ09QWSBhbHdheXMgc2VsZWN0IFZJREVPX0RBTUFHRQo+
Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gdjI6Cj4+Pj4+Pj4+Pj4+Pj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjIwNjA5MjI1OTIxLjYyNDYyLTEtYWdyYWZAY3NncmFmLmRlLwo+
Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+Pj4+Pj4+Pj4+PiAt
IFJlbW92ZSBpZmRlZnMKPj4+Pj4+Pj4+Pj4+PiAtIEZpeCByYW5nZXMgaW4gdHJ1ZXR5cGUgdGFy
Z2V0Cj4+Pj4+Pj4+Pj4+Pj4gLSBMaW1pdCByb3RhdGUgdG8gbmVjZXNzYXJ5IGRhbWFnZQo+Pj4+
Pj4+Pj4+Pj4+IC0gUmVtb3ZlIGlmZGVmcyBmcm9tIGdvcAo+Pj4+Pj4+Pj4+Pj4+IC0gRml4IGRj
YWNoZSByYW5nZTsgd2Ugd2VyZSBmbHVzaGluZyB0b28gbXVjaCBiZWZvcmUKPj4+Pj4+Pj4+Pj4+
PiAtIEFkZCBwYXRjaCAidmlkZW86IFVzZSBWSURFT19EQU1BR0UgZm9yIFZJREVPX0NPUFkiCj4+
Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiB2MToKPj4+Pj4+Pj4+Pj4+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyMjA2MDYyMzQzMzYuNTAyMS0xLWFncmFmQGNzZ3JhZi5kZS8KPj4+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IEFsZXhhbmRlciBHcmFmICg5KToKPj4+Pj4+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoCBkbTogdmlkZW86IEFkZCBkYW1hZ2UgdHJhY2tpbmcgQVBJCj4+Pj4+
Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgZG06IHZpZGVvOiBBZGQgZGFtYWdlIG5vdGlmaWNhdGlv
biBvbiBkaXNwbGF5IGZpbGxzCj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgdmlkY29uc29s
ZTogQWRkIGRhbWFnZSBub3RpZmljYXRpb25zIHRvIGFsbAo+Pj4+Pj4+Pj4+Pj4+IHZpZGNvbnNv
bGUgZHJpdmVycwo+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHZpZGVvOiBBZGQgZGFtYWdl
IG5vdGlmaWNhdGlvbiBvbiBibXAgZGlzcGxheQo+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
IGVmaV9sb2FkZXI6IEdPUDogQWRkIGRhbWFnZSBub3RpZmljYXRpb24gb24gQkxUCj4+Pj4+Pj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgdmlkZW86IE9ubHkgZGNhY2hlIGZsdXNoIGRhbWFnZWQgbGlu
ZXMKPj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCB2aWRlbzogVXNlIFZJREVPX0RBTUFHRSBm
b3IgVklERU9fQ09QWQo+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHZpZGVvOiBBbHdheXMg
Y29tcGlsZSBjYWNoZSBmbHVzaGluZyBjb2RlCj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAg
dmlkZW86IEVuYWJsZSBWSURFT19EQU1BR0UgZm9yIGRyaXZlcnMgdGhhdCBuZWVkIGl0Cj4+Pj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBBbHBlciBOZWJpIFlhc2FrICg0KToKPj4+Pj4+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoCB2aWRlbzogdGVzdDogU3BsaXQgY29weSBmcmFtZSBidWZmZXIgY2hl
Y2sgaW50byBhCj4+Pj4+Pj4+Pj4+Pj4gZnVuY3Rpb24KPj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoCB2aWRlbzogdGVzdDogU3VwcG9ydCBjaGVja2luZyBjb3B5IGZyYW1lIGJ1ZmZlcgo+Pj4+
Pj4+Pj4+Pj4+IGNvbnRlbnRzCj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgdmlkZW86IHRl
c3Q6IFRlc3QgcGFydGlhbCB1cGRhdGVzIG9mIGhhcmR3YXJlIGZyYW1lCj4+Pj4+Pj4+Pj4+Pj4g
YnVmZmVyCj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgdmlkZW86IHRlc3Q6IFRlc3Qgdmlk
ZW8gZGFtYWdlIHRyYWNraW5nIHZpYSB2aWRjb25zb2xlCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
Pj4+PiDCoMKgwqDCoMKgwqAgYXJjaC9hcm0vbWFjaC1vbWFwMi9vbWFwMy9LY29uZmlnIHzCoMKg
IDEgKwo+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBhcmNoL2FybS9tYWNoLXN1bnhpL0tjb25m
aWfCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGRyaXZl
cnMvdmlkZW8vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjYgKysrCj4+Pj4+
Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGRyaXZlcnMvdmlkZW8vY29uc29sZV9ub3JtYWwuY8KgwqDC
oCB8wqAgMjcgKystLQo+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBkcml2ZXJzL3ZpZGVvL2Nv
bnNvbGVfcm90YXRlLmPCoMKgwqAgfMKgIDk0ICsrKysrKystLS0tCj4+Pj4+Pj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgIGRyaXZlcnMvdmlkZW8vY29uc29sZV90cnVldHlwZS5jwqAgfMKgIDM3ICsrKy0t
Cj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGRyaXZlcnMvdmlkZW8vZXh5bm9zL0tjb25maWfC
oMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBkcml2ZXJzL3Zp
ZGVvL2lteC9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4+Pj4+Pj4+Pj4+PiDC
oMKgwqDCoMKgwqAgZHJpdmVycy92aWRlby9tZXNvbi9LY29uZmlnwqDCoMKgwqDCoMKgIHzCoMKg
IDEgKwo+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBkcml2ZXJzL3ZpZGVvL3JvY2tjaGlwL0tj
b25maWfCoMKgwqAgfMKgwqAgMSArCj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGRyaXZlcnMv
dmlkZW8vc3RtMzIvS2NvbmZpZ8KgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4+Pj4+Pj4+Pj4+PiDC
oMKgwqDCoMKgwqAgZHJpdmVycy92aWRlby90ZWdyYTIwL0tjb25maWfCoMKgwqDCoCB8wqDCoCAx
ICsKPj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgZHJpdmVycy92aWRlby90aWRzcy9LY29uZmln
wqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBkcml2ZXJz
L3ZpZGVvL3ZpZGNvbnNvbGUtdWNsYXNzLmMgfMKgIDE2IC0tCj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgIGRyaXZlcnMvdmlkZW8vdmlkZW8tdWNsYXNzLmPCoMKgwqDCoMKgIHwgMTkwCj4+Pj4+
Pj4+Pj4+Pj4gKysrKysrKysrKysrLS0tLS0tLS0tLQo+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDC
oCBkcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA3ICstCj4+
Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGluY2x1ZGUvdmlkZW8uaMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTkgKysrLS0tLQo+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoCBpbmNsdWRlL3ZpZGVvX2NvbnNvbGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA1MiAt
LS0tLS0KPj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgbGliL2VmaV9sb2FkZXIvZWZpX2dvcC5j
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDcgKwo+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCB0
ZXN0L2RtL3ZpZGVvLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyNTYK
Pj4+Pj4+Pj4+Pj4+PiArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPj4+Pj4+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqAgMjAgZmlsZXMgY2hhbmdlZCwgNDgzIGluc2VydGlvbnMoKyksIDI5NyBk
ZWxldGlvbnMoLSkKPj4+Pj4+Pj4+Pj4+IEl0IGlzIGdvb2QgdG8gc2VlIHRoaXMgdGlkaWVkIHVw
IGludG8gc29tZXRoaW5nIHRoYXQgY2FuIGJlCj4+Pj4+Pj4+Pj4+PiBhcHBsaWVkIQo+Pj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IEkgYW0gdW5zdXJlIHdoYXQgaXMgZ29pbmcgb24gd2l0aCB0aGUg
RUZJIHBlcmZvcm1hbmNlLAo+Pj4+Pj4+Pj4+Pj4gdGhvdWdoLiBJdAo+Pj4+Pj4+Pj4+Pj4gc2hv
dWxkIG5vdCBmbHVzaCB0aGUgY2FjaGUgYWZ0ZXIgZXZlcnkgY2hhcmFjdGVyLCBvbmx5IGFmdGVy
Cj4+Pj4+Pj4+Pj4+PiBhIG5ldwo+Pj4+Pj4+Pj4+Pj4gbGluZS4gSXMgdGhlcmUgc29tZXRoaW5n
IHdyb25nIGluIGhlcmU/IElmIHNvLCB3ZSBzaG91bGQgZml4Cj4+Pj4+Pj4+Pj4+PiB0aGF0IGJ1
Zwo+Pj4+Pj4+Pj4+Pj4gZmlyc3QgYW5kIGl0IHNob3VsZCBiZSBwYXRjaCAxIG9mIHRoaXMgc2Vy
aWVzLgo+Pj4+Pj4+Pj4+PiBCZWZvcmUgSSBjYW1lIHVwIHdpdGggdGhpcyBzZXJpZXMsIEkgd2Fz
IHRyeWluZyB0byBpZGVudGlmeQo+Pj4+Pj4+Pj4+PiB0aGUgVUVGSSBidWcKPj4+Pj4+Pj4+Pj4g
aW4gcXVlc3Rpb24gYXMgd2VsbCwgYmVjYXVzZSBpbnR1aXRpb24gdG9sZCBtZSBzdXJlbHkgdGhp
cyBpcwo+Pj4+Pj4+Pj4+PiBhIGJ1ZyBpbgo+Pj4+Pj4+Pj4+PiBVRUZJIDopLiBUdXJucyBvdXQg
aXQgcmVhbGx5IGlzbid0IHRoaXMgdGltZSBhcm91bmQuCj4+Pj4+Pj4+Pj4gSSBkb24ndCBtZWFu
IGEgYnVnIGluIFVFRkksIEkgbWVhbiBhIGJ1ZyBpbiBVLUJvb3QncyBFRkkKPj4+Pj4+Pj4+PiBp
bXBsZW1lbnRhdGlvbi4gV2hlcmUgZGlkIHlvdSBsb29rIGZvciB0aGUgYnVnPwo+Pj4+Pj4+Pj4g
VGhlICJyZWFsIiBidWcgaXMgaW4gZ3J1Yi4gQnV0IGdpdmVuIHRoYXQgaXQncyByZWFzb25hYmx5
Cj4+Pj4+Pj4+PiBzaW1wbGUgdG8gd29yawo+Pj4+Pj4+Pj4gYXJvdW5kIGluIFUtQm9vdCBhbmQg
ZXZlbiB3aXRoIGl0ICJmaXhlZCIgaW4gZ3J1YiB3ZSB3b3VsZAo+Pj4+Pj4+Pj4gc3RpbGwgc2Vl
Cj4+Pj4+Pj4+PiBwZXJmb3JtYW5jZSBiZW5lZml0cyBmcm9tIGZsdXNoaW5nIG9ubHkgcGFydHMg
b2YgdGhlIHNjcmVlbiwgSQo+Pj4+Pj4+Pj4gdGhpbmsKPj4+Pj4+Pj4+IGl0J3Mgd29ydGggbGl2
aW5nIHdpdGggdGhlIGdydWIgZGVmaWNpZW5jeS4KPj4+Pj4+Pj4gT0sgdGhhbmtzIGZvciBkaWdn
aW5nIGludG8gaXQuIEkgc3VnZ2VzdCB3ZSBhZGQgYSBwYXJhbSB0bwo+Pj4+Pj4+PiB2aWRjb25z
b2xlX3B1dHMoKSB0byB0ZWxsIGl0IHdoZXRoZXIgdG8gc3luYyBvciBub3QsIHRoZW4gdGhlCj4+
Pj4+Pj4+IEVGSSBjb2RlCj4+Pj4+Pj4+IGNhbiBpbmRpY2F0ZSB0aGlzIGFuZCB0cnkgdG8gYmUg
YSBiaXQgc21hcnRlciBhYm91dCBpdC4KPj4+Pj4+PiBJdCBkb2Vzbid0IGtub3cgd2hlbiB0byBz
eW5jIGVpdGhlci4gRnJvbSBpdHMgcG9pbnQgb2YgdmlldywgYW55Cj4+Pj4+Pj4gImNvbnNvbGUg
b3V0cHV0IiBjb3VsZCBiZSB0aGUgbGFzdCBvbmUuIFRoZXJlIGlzIG5vIEFQSSBpbiBVRUZJIHRo
YXQKPj4+Pj4+PiBzYXlzICJwbGVhc2UgZmx1c2ggY29uc29sZSBvdXRwdXQgbm93Ii4KPj4+Pj4+
IFllcywgSSB1bmRlcnN0YW5kLiBJIHdhcyBub3Qgc3VnZ2VzdGluZyB3ZSB3ZXJlIG1pc3Npbmcg
YW4gQVBJLiBCdXQKPj4+Pj4+IHNvbWUgc29ydCBvZiBoZXVyaXN0aWMgd291bGQgZG8sIGUuZy4g
b25seSBmbHVzaCBvbiBhIG5ld2xpbmUsIGZsdXNoCj4+Pj4+PiBldmVyeSA1MCBjaGFycywgZXRj
Lgo+Pj4+PiBJIGNhbid0IHRoaW5rIG9mIGFueSBoZXVyaXN0aWMgdGhhdCB3b3VsZCByZWxpYWJs
eSB3b3JrLiBSZWxldmFudCBmb3IKPj4+Pj4gdGhpcyBjb252ZXJzYXRpb24sIFVFRkkgcHJvdmlk
ZXMgMiBjYWxsczoKPj4+Pj4KPj4+Pj4gwqDCoMKgwqAgKiBXcml0ZSBzdHJpbmcgdG8gc2NyZWVu
IChlZmlfY291dF9vdXRwdXRfc3RyaW5nKQo+Pj4+PiDCoMKgwqDCoCAqIFNldCB0ZXh0IGN1cnNv
ciBwb3NpdGlvbiB0byBYLCBZIChlZmlfY291dF9zZXRfY3Vyc29yX3Bvc2l0aW9uKQo+Pj4+Pgo+
Pj4+PiBJdCdzIHBlcmZlY3RseSBsZWdhbCBmb3IgYSBVRUZJIGFwcGxpY2F0aW9uIHRvIGRvIHNv
bWV0aGluZyBsaWtlCj4+Pj4+Cj4+Pj4+IGVmaV9jb3V0X3NldF9jdXJzb3JfcG9zaXRpb24oMTAs
IDEwKTsKPj4+Pj4gZWZpX2NvdXRfb3V0cHV0X3N0cmluZygiZiIpOwo+Pj4+PiBlZmlfY291dF9v
dXRwdXRfc3RyaW5nKCJvIik7Cj4+Pj4+IGVmaV9jb3V0X291dHB1dF9zdHJpbmcoIm8iKSA7Cj4+
Pj4+Cj4+Pj4+IHRvIHVwZGF0ZSBjb250ZW50cyBvZiBhIHZpcnR1YWwgdGV4dCBib3ggb24gdGhl
IHNjcmVlbi4gV2hlcmUgaW4gdGhpcwo+Pj4+PiBjaGFpbiBvZiBldmVudHMgd291bGQgd2UgY2Fs
bCB2aWRlb19zeW5jKCksIGJ1dCBvbiBldmVyeSBjYWxsIHRvCj4+Pj4+IGVmaV9jb3V0X291dHB1
dF9zdHJpbmcoKT8KPj4+PiBBY3R1YWxseSBVLUJvb3QgaGFzIHRoZSBzYW1lIHByb2JsZW0sIGJ1
dCB3ZSBoYXZlIG1hbmFnZWQgdG8gd29yawo+Pj4+IG91dCBzb21ldGhpbmcuCj4+Pgo+Pj4gVS1C
b290IGFzIGEgY29kZSBiYXNlIGhhcyBhIG11Y2ggZWFzaWVyIHN0YW5jZTogSXQgY2FuIGFkZCBB
UElzIHdoZW4gaXQKPj4+IG5lZWRzIHRoZW0gaW4gcGxhY2VzIHRoYXQgcmVxdWlyZSB0aGVtLiBX
aXRoIFVFRkkgKGFzIHdlbGwgYXMgdGhlIFUtQm9vdAo+Pj4gbmF0aXZlIEFQSSksIHdlJ3JlIHN0
dWNrIHdpdGggd2hhdCdzIHRoZXJlLgo+Pj4KPj4+IEkgYWxzbyBkb24ndCB1bmRlcnN0YW5kIHdo
YXQgeW91IG1lYW4gYnkgIndlIGhhdmUgbWFuYWdlZCB0byB3b3JrIG91dAo+Pj4gc29tZXRoaW5n
Ii4gVGhpcyBwYXRjaCBzZXQgaXMgbm90IGEgVUVGSSBmaXggLSBpdCBmaXhlcyBnZW5lcmljIFUt
Qm9vdAo+Pj4gYmVoYXZpb3IgYW5kIHNwZWVkcyB1cCBub24tVUVGSSBib290cyBhcyB3ZWxsLiBU
aGUgaW1wcm92ZW1lbnQgdGhlcmUgaXMKPj4+IGp1c3Qgbm90IGFzIGltcHJlc3NpdmUgYXMgd2l0
aCBncnViIDopLgo+PiBXZSBhcmUgc3RpbGwgbm90IHF1aXRlIG9uIHRoZSBzYW1lIHBhZ2UuLi4K
Pj4KPj4gVS1Cb290IGRvZXMgaGF2ZSB2aWRlb19zeW5jKCkgYnV0IGl0IGRvZXNuJ3Qga25vdyB3
aGVuIHRvIGNhbGwgaXQuIElmCj4+IGl0IGRvZXMgbm90IGNhbGwgaXQsIHRoZW4gYW55IGFtb3Vu
dCBvZiBzaW5nbGUtdGhyZWFkZWQgY29kZSBjYW4gcnVuCj4+IGFmdGVyIHRoYXQsIHdoaWNoIG1h
eSB1cGRhdGUgdGhlIGZyYW1lYnVmZmVyLiBJbiBvdGhlciB3b3JkcywgVS1Cb290Cj4+IGlzIGlu
IGV4YWN0bHkgdGhlIHNhbWUgYm9hdCBhcyBVRUZJLiBJdCBoYXMgdG8gZGVjaWRlIHdoZXRoZXIg
dG8gY2FsbAo+PiB2aWRlb19zeW5jKCkgYmFzZWQgb24gc29tZSBzb3J0IG9mIGhldXJpc3RpYy4K
Pj4KPj4gVGhhdCBpcyB0aGUgb25seSBwb2ludCBJIGFtIHRyeWluZyB0byBtYWtlIGhlcmUuIERv
ZXMgdGhhdCBtYWtlIHNlbnNlPwo+Cj4KPiBPaCwgSSB0aG91Z2h0IHlvdSBtZW50aW9uZWQgYWJv
dmUgdGhhdCBVLUJvb3QgaXMgaW4gYSBiZXR0ZXIgc3BvdCBvcgo+ICJoYXMgaXQgc29sdmVkIGFs
cmVhZHkiLiBJIGFncmVlIC0gaXQncyBpbiB0aGUgc2FtZSBib2F0IGFuZCB0aGUgb25seQo+IHNh
ZmUgdGhpbmcgaXQgY2FuIHJlYWxseSBkbyB0b2RheSB0aGF0IGlzIGZ1bGx5IGNyb3NzLXBsYXRm
b3JtCj4gY29tcGF0aWJsZSBpcyB0byBjYWxsIHZpZGVvX3N5bmMoKSBhZnRlciBldmVyeSBjaGFy
YWN0ZXIuCj4KPiBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBieSAiYW55IGFtb3Vu
dCBvZiBzaW5nbGUtdGhyZWFkZWQgY29kZQo+IGNhbiBydW4gYWZ0ZXIgdGhhdCwgd2hpY2ggbWF5
IHVwZGF0ZSB0aGUgZnJhbWVidWZmZXIiLiBBbnkgZnJhbWVidWZmZXIKPiBtb2RpZmljYXRpb24g
aXMgVS1Cb290IGludGVybmFsIGNvZGUgd2hpY2ggdGhlbiBhZ2FpbiBjYW4gYXBwbHkKPiB2aWRl
b19zeW5jKCkgdG8gdGVsbCB0aGUgc3lzdGVtICJJIHdhbnQgd2hhdCBJIHdyb3RlIHRvIHNjcmVl
biBhY3R1YWxseQo+IGJlIG9uIHNjcmVlbiBub3ciLiBJIGRvbid0IHRoaW5rIHRoYXQncyBuZWNl
c3NhcmlseSBiYWQgZGVzaWduLiBBIGJpdAo+IGNsdW5reSwgYnV0IHdlJ3JlIGluIGEgcHJlLWJv
b3QgZW52aXJvbm1lbnQgYWZ0ZXIgYWxsLgo+Cj4gU2luY2Ugd2UncmUgYWxpZ25lZCBub3c6IFdo
YXQgZXhhY3RseSBkaWQgeW91IHJlZmVyIHRvIHdpdGggImJ1dCB3ZSBoYXZlCj4gbWFuYWdlZCB0
byB3b3JrIG91dCBzb21ldGhpbmciPwoKU2hvdWxkIHdlIHNldCBQaXhlbEJsdE9ubHkgdG8gaW5k
aWNhdGUgdG8gVUVGSSBhcHBsaWNhdGlvbnMgdGhhdCB0aGV5CmFyZSBub3QgYWxsb3dlZCB0byBk
aXJlY3RseSB3cml0ZSB0byB0aGUgZnJhbWVidWZmZXIgYnV0IGFsd2F5cyBoYXZlIHRvCnVzZSBC
aXRCbHQ/IEdSVUIgc2VlbXMgdG8gYmUgdXNpbmcgYSBzaGFkb3cgYnVmZmVyIGJ5IGRlZmF1bHQg
d2hpY2ggaXQKY29waWVzIHZpYSBCaXRCbHQuCgpCZXN0IHJlZ2FyZHMKCkhlaW5yaWNoCgo+Cj4K
Pj4KPj4+Cj4+Pj4gSSBkbyB0aGluayBpdCBpcyBzdGlsbCB0byBmbHVzaCB0aGUgY2FjaGUgb24g
ZXZlcnkgY2hhci4gSSBzdXNwZWN0IHlvdQo+Pj4+IHdpbGwgZmluZCB0aGF0IGV2ZW4gYSBzaW1w
bGUgaGV1cmlzdGljIGxpa2UgSSBtZW50aW9uZWQgd291bGQgYmUgZ29vZAo+Pj4+IGVub3VnaC4K
Pj4+Pgo+Pj4+IEFsc28gSSBub3RpY2UgdGhhdCBFRkkgY2FsbHMgbm90aWZ5PyBhbGwgdGhlIHRp
bWUsIHNvIFUtQm9vdCBwcm9iYWJseQo+Pj4+IGRvZXMgaGF2ZSB0aGUgYWJpbGl0eSB0byBzeW5j
IHRoZSB2aWRlbyBldmVyeSAxMG1zIGlmIHdlIHdhbnRlZCB0by4KPj4+Cj4+PiBJIGZhaWwgdG8g
c2VlIGhvdyBpbnZhbGlkYXRpbmcgdGhlIGZyYW1lIGJ1ZmZlciBmb3IgdGhlIHNjcmVlbiBldmVy
eQo+Pj4gMTBtcyBpcyBhbnkgYmV0dGVyIHRoYW4gZG9pbmcgZmx1c2graW52YWxpZGF0ZSBvcGVy
YXRpb25zIG9ubHkgb24gc2NyZWVuCj4+PiBhcmVhcyB0aGF0IGNoYW5nZWQ/IEl0J3MgbW9yZSBm
cmFnaWxlLCBtb3JlIGRpZmZpY3VsdCB0byB1bmRlcnN0YW5kIGFuZAo+Pj4gYWxzbyBzaWduaWZp
Y2FudGx5IG1vcmUgZXhwZW5zaXZlIGdpdmVuIHRoYXQgbW9zdCBvZiB0aGUgdGltZSB2ZXJ5Cj4+
PiBsaXR0bGUgb24gdGhlIHNjcmVlbiBhY3R1YWxseSBjaGFuZ2VzLgo+PiBJIGFtIG5vdCBzdWdn
ZXN0aW5nIGl0IGlzIGJldHRlciwgYXQgYWxsLiBJIGFtIGp1c3QgdHJ5aW5nIHRvIGV4cGxhaW4K
Pj4gdGhhdCB0aGUgVS1Cb290IEVGSSBpbXBsZW1lbnRhdGlvbiBzaG91bGQgbm90IGJlIGNhbGxp
bmcgdmlkZW9fc3luYygpCj4+IGFmdGVyIGV2ZXJ5IGNoYXJhY3RlciwgYmVmb3JlIG9yIGFmdGVy
IHRoaXMgc2VyaWVzLgo+Cj4KPiBBaCwgaXQgZG9lc24ndCA6KS4gSXQganVzdCBjYWxscyB0aGUg
bm9ybWFsIFUtQm9vdCAid3JpdGUgY2hhcmFjdGVyIG9uCj4gc2NyZWVuIiBmdW5jdGlvbi4gV2hh
dCB0aGF0IGRvZXMgaXMgdXAgdG8gVS1Cb290IGludGVybmFscyAtIGFuZCB0aG9zZQo+IGJhc2lj
YWxseSB0b2RheSBkaWN0YXRlIHRoYXQgc29tZXRoaW5nIG5lZWRzIHRvIGNhbGwgdmlkZW9fc3lu
YygpIHRvCj4gbWFrZSBGQiBtb2RpZmljYXRpb25zIGFjdHVhbGx5IHBvcCB1cCBvbiBzY3JlZW4u
Cj4KPgo+Pgo+Pj4KPj4+PiBJdCBzZWVtcyBmcm9tIHRoaXMgZGlzY3Vzc2lvbiB0aGF0IHdlIGhh
dmUgbWFkZSBncmVhdCB0aGUgZW5lbXkgb2YKPj4+PiB0aGUgZ29vZC4KPj4+Cj4+PiBJIGFncmVl
LiBEYW1hZ2UgdHJhY2tpbmcgaW4gdGhpcyBwYXRjaCBzZXQgaXMgZWxlZ2FudCwgc2ltcGxlLAo+
Pj4gcHJlZGljdGFibGUsIGxvdyBvdmVyaGVhZCBhbmQgYmFzaWNhbGx5IGp1c3QgYWJzdHJhY3Rz
IHRoZSB2aWRlbyBjb3B5Cj4+PiBjb2RlIHBhdGggdG8gYSBnZW5lcmljIHNvbHV0aW9uLiBBbGwg
d2hpbGUgaXQgcHJldHR5IG11Y2ggc29sdmVzIHRoZQo+Pj4gaXNzdWUgZm9yIGdvb2QuIEkgZG9u
J3QgdW5kZXJzdGFuZCB3aGF0J3Mgbm90IHRvIGxpa2UgYWJvdXQgaXQgOikKPj4gSSB0aGluayBp
dCBpcyBhIHJlYWxseSBuaWNlIGZlYXR1cmUgYW5kIEkgaG9wZSBpdCBjYW4gYmUgYXBwbGllZCBz
b29uLgo+Cj4KPiBUaGFua3MgYSBsb3QgZXNwZWNpYWxseSB0byBBbHBlciBmb3IgcGlja2luZyBp
dCB1cC4gSSBoYWQgYWxtb3N0Cj4gZm9yZ290dGVuIGFib3V0IHRoZSBwYXRjaCBzZXQgOikKPgo+
Cj4gQWxleAo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
