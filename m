Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C21901D0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Jun 2024 10:37:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C61D4C78007;
	Mon, 10 Jun 2024 08:37:16 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A8DAC6C838
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 08:37:09 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52bc3130ae6so2516582e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foundries.io; s=google; t=1718008628; x=1718613428;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vn5ZPHR126rPkkRCsFkIkiFQtWLPG8ppHEfcAlk14lY=;
 b=Od8eoQKdLfkZuHiU4UK973f/7ava6dzhITGGwmS57vX2P6g32WUXeLJCFJHSJMvrr8
 0gPTU0+BIaO1TYOX1vgQGbmINeGzQ8vD0wZVbPdb2vOAqdXyrj5MVMudNwNDn20d4pgF
 3IASwl9E0p6Bj2trSRMxv3ZtyWUTj2iSrRE0yUml9AysV/n+NynXwWjvwnoOMnEEpx+1
 pKfQOjuPhy2kk3dc6B5gl8ZudxLgR6MaN8IS+FC2zAn1gT0vvM7Mx8Nuh7RDVTETpsS9
 QQywnfRZKPiGvLTrPowoyAhLNc14TmLRWIvqy7wOZD9YLKzN2qjFc7Ir/5RzYfLsxK2k
 t1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718008628; x=1718613428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vn5ZPHR126rPkkRCsFkIkiFQtWLPG8ppHEfcAlk14lY=;
 b=wPxi7t4CyUGx9U91AQ/rdn3tzQ+NdqPR8xqED+f5wg4Rzoqn183ft90G46Uxfb2P04
 NyuinlqSbWl88X+YUhJwmv49fOZQ9mYDSmH6JI2S326gqX8XZxHI0EeBuK1Lyim+5Tma
 Egs/bUg3u40ugPQz6vun6aTfHWqqBCPkOmQ7Xlq1Fi+fO0Dxav9XZ9jpHOYT39LS3xt5
 YrUUl3EgD840q2Wi8RYdI/eFKprBo8xS4R24/UDeOIWo60K5oYmp7eg9ItIqlhTRXI0a
 O1PI5qLXdxIOYu+1kXn1+FPp2aWJHFxoWRWTFhvh5ljCVKLW4tAVdvb0XwjG6t5vA9Rd
 VUQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHQde5TD7I+pBiIgdFCmr1w8MTJvCjg3Rcm+Ar2T7lXge5TBFhu5Fb8cA+0iswmqbrosbrsXeblTpUdUzf83dq9vgxqMpSCu/yG0xNxbw0b2meUoR7fyf/
X-Gm-Message-State: AOJu0YxxZ4sSH3sMZw402DvcImUI+bbFqsa88Pyu9gXHHGzYuvKdiV4A
 /xq0K/V73wNHvY3ddyPrtyqoifFi0MhSuxusEIXIw5reOCbaJect9oGPzW4qAbNTr1lRjiS0iEJ
 Xlhz/OdFQ6xaQCZXEx+v00+wR7pxOtJopWqXDPQ==
X-Google-Smtp-Source: AGHT+IFKgSWg/r+n0l9DNilpf9GJADLjPK9/esge2l4fOvI38UsvaY6TK1KjclU72ahH6jYuAO+uKVA9k+lLkcUqj48=
X-Received: by 2002:a05:6512:3f10:b0:52b:59f7:7602 with SMTP id
 2adb3069b0e04-52bb9f66381mr7327433e87.8.1718008628403; Mon, 10 Jun 2024
 01:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240419220331.277574-1-marex@denx.de>
In-Reply-To: <20240419220331.277574-1-marex@denx.de>
From: Igor Opaniuk <igor.opaniuk@foundries.io>
Date: Mon, 10 Jun 2024 10:36:56 +0200
Message-ID: <CAL6CDMHFDhcUXhz5+w92SqKa0jC1TNPEiyvRS=jZ4CBqTm7=PA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Ping IWDG on exit from PSCI
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gU2F0LCBBcHIgMjAsIDIwMjQgYXQgMTI6MDPigK9BTSBNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4gd3JvdGU6Cj4KPiBNYWtlIHN1cmUgdGhlIE9TIHdvdWxkIG5vdCBnZXQgYW55IHNwdXJp
b3VzIElXREcgcHJldGltZW91dCBJUlEKPiByaWdodCBhZnRlciB0aGUgc3lzdGVtIHdha2VzIHVw
LiBUaGlzIG1heSBoYXBwZW4gaW4gY2FzZSB0aGUgU29DCj4gZ290IHdva2VuIHVwIGJ5IGFub3Ro
ZXIgc291cmNlIHRoYW4gdGhlIElXREcgcHJldGltZW91dCBhbmQgdGhlCj4gcHJldGltZW91dCBJ
UlEgYXJyaXZlZCBpbW1lZGlhdGVseSBhZnRlcndhcmQsIGJ1dCB0b28gbGF0ZSB0byBiZQo+IGhh
bmRsZWQgYnkgdGhlIHN1c3BlbmQgbWFpbiBsb29wLiBJbiBjYXNlIGVpdGhlciBvZiB0aGUgSVdE
RyBpcwo+IGVuYWJsZWQsIHBpbmcgaXQgZmlyc3QgYW5kIHRoZW4gcmV0dXJuIHRvIHRoZSBPUy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IC0tLQo+IENj
OiBJZ29yIE9wYW5pdWsgPGlnb3Iub3Bhbml1a0Bmb3VuZHJpZXMuaW8+Cj4gQ2M6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IENjOiBQYXRyaWNrIERlbGF1
bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IENjOiBTaW1vbiBHbGFzcyA8c2pn
QGNocm9taXVtLm9yZz4KPiBDYzogVG9tIFJpbmkgPHRyaW5pQGtvbnN1bGtvLmNvbT4KPiBDYzog
dS1ib290QGRoLWVsZWN0cm9uaWNzLmNvbQo+IENjOiB1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCj4gLS0tCj4gIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9w
c2NpLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJt
cDEvcHNjaS5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL3BzY2kuYwo+IGluZGV4
IDRmMjM3OWRmNDVmLi5lOTkxMDM5MTBkOSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0
bTMybXAvc3RtMzJtcDEvcHNjaS5jCj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMy
bXAxL3BzY2kuYwo+IEBAIC04MDgsNiArODA4LDI3IEBAIHZvaWQgX19zZWN1cmUgcHNjaV9zeXN0
ZW1fc3VzcGVuZCh1MzIgX19hbHdheXNfdW51c2VkIGZ1bmN0aW9uX2lkLAo+ICAgICAgICAgd3Jp
dGVsKFNZU0NGR19DTVBFTlJfTVBVRU4sIFNUTTMyX1NZU0NGR19CQVNFICsgU1lTQ0ZHX0NNUEVO
U0VUUik7Cj4gICAgICAgICBjbHJiaXRzX2xlMzIoU1RNMzJfU1lTQ0ZHX0JBU0UgKyBTWVNDRkdf
Q01QQ1IsIFNZU0NGR19DTVBDUl9TV19DVFJMKTsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IE1ha2Ugc3VyZSB0aGUgT1Mgd291bGQgbm90IGdldCBhbnkgc3B1cmlvdXMgSVdERyBwcmV0aW1l
b3V0IElSUQo+ICsgICAgICAgICogcmlnaHQgYWZ0ZXIgdGhlIHN5c3RlbSB3YWtlcyB1cC4gVGhp
cyBtYXkgaGFwcGVuIGluIGNhc2UgdGhlIFNvQwo+ICsgICAgICAgICogZ290IHdva2VuIHVwIGJ5
IGFub3RoZXIgc291cmNlIHRoYW4gdGhlIElXREcgcHJldGltZW91dCBhbmQgdGhlCj4gKyAgICAg
ICAgKiBwcmV0aW1lb3V0IElSUSBhcnJpdmVkIGltbWVkaWF0ZWx5IGFmdGVyd2FyZCwgYnV0IHRv
byBsYXRlIHRvIGJlCj4gKyAgICAgICAgKiBoYW5kbGVkIGJ5IHRoZSBtYWluIGxvb3AgYWJvdmUu
IEluIGNhc2UgZWl0aGVyIG9mIHRoZSBJV0RHIGlzCj4gKyAgICAgICAgKiBlbmFibGVkLCBwaW5n
IGl0IGZpcnN0IGFuZCB0aGVuIHJldHVybiB0byB0aGUgT1MuCj4gKyAgICAgICAgKi8KPiArCj4g
KyAgICAgICAvKiBQaW5nIElXREcxIGFuZCBBQ0sgcHJldGltZXIgSVJRICovCj4gKyAgICAgICBp
ZiAoZ2ljX2VuYWJsZWRbNF0gJiBCSVQoMjIpKSB7Cj4gKyAgICAgICAgICAgICAgIHdyaXRlbChJ
V0RHX0tSX1JFTE9BRF9LRVksIFNUTTMyX0lXREcxX0JBU0UgKyBJV0RHX0tSKTsKPiArICAgICAg
ICAgICAgICAgd3JpdGVsKElXREdfRVdDUl9FV0lDLCBTVE0zMl9JV0RHMV9CQVNFICsgSVdER19F
V0NSKTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICAvKiBQaW5nIElXREcyIGFuZCBBQ0sgcHJl
dGltZXIgSVJRICovCj4gKyAgICAgICBpZiAoZ2ljX2VuYWJsZWRbNF0gJiBCSVQoMjMpKSB7Cj4g
KyAgICAgICAgICAgICAgIHdyaXRlbChJV0RHX0tSX1JFTE9BRF9LRVksIFNUTTMyX0lXREcyX0JB
U0UgKyBJV0RHX0tSKTsKPiArICAgICAgICAgICAgICAgd3JpdGVsKElXREdfRVdDUl9FV0lDLCBT
VE0zMl9JV0RHMl9CQVNFICsgSVdER19FV0NSKTsKPiArICAgICAgIH0KPiArCj4gICAgICAgICAv
Kgo+ICAgICAgICAgICogVGhlIHN5c3RlbSBoYXMgcmVzdW1lZCBzdWNjZXNzZnVsbHkuIFJld3Jp
dGUgTFIgcmVnaXN0ZXIgc3RvcmVkCj4gICAgICAgICAgKiBvbiBzdGFjayB3aXRoICdlcCcgdmFs
dWUsIHNvIHRoYXQgb24gcmV0dXJuIGZyb20gdGhpcyBQU0NJIGNhbGwsCj4gLS0KPiAyLjQzLjAK
PgoKUmV2aWV3ZWQtYnk6IElnb3IgT3Bhbml1ayA8aWdvci5vcGFuaXVrQGZvdW5kcmllcy5pbz4K
Ci0tIApCZXN0IHJlZ2FyZHMgLSBGcmV1bmRsaWNoZSBHcsO8c3NlIC0gTWVpbGxldXJlcyBzYWx1
dGF0aW9ucwoKSWdvciBPcGFuaXVrClNlbmlvciBTb2Z0d2FyZSBFbmdpbmVlciwgRW1iZWRkZWQg
JiBTZWN1cml0eQpFOiBpZ29yLm9wYW5pdWtAZm91bmRyaWVzLmlvClc6IHd3dy5mb3VuZHJpZXMu
aW8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
