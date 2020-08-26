Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3CF25252D
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Aug 2020 03:47:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4883FC32EA7
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Aug 2020 01:47:16 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABD9FC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 01:47:15 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u18so196571wmc.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Aug 2020 18:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xPmzqo2ZpUOHgCzuInQZBGlKyAFohYv+Wikeh6cxKLU=;
 b=t6ty2SZUm/5ZpMAAFXvr1gdGSErjPzXDX9QtNLE6iysr6qDzqhJfhAL7USIdLTKD1k
 ro4ideJK1Orh3cDdTrXpMoLpBgar2Qcyl6Ik9DBVTEnkJIGLOHC6r3gYbqknIPmD+Y7v
 mFnricwkp6sOnzfgoexfo/Zb2VjYiCBJXPGAW8Gsh+V9IR07ugNJsMGKTEeFheAPzrZk
 QwNMogTyE/5x0pwzKfv0M/Sq8C6WydU6CZHxUQaapi/HT6wtdjPGUTv8LBaLFUjKXpJM
 6kbK0/2eJZaKjx1Yi2JJG6h5M8PphzSFojtYDJgNzwcHxAsUTdHH/88lPkoa20kT+yqB
 /q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xPmzqo2ZpUOHgCzuInQZBGlKyAFohYv+Wikeh6cxKLU=;
 b=EKCAF+YS7FGNYD2FpfBJdkpT7ueHOF7iURYtkAq2u8BAMmDGwclLPHzx5PXFrvy/al
 jA1Qb4XKutElyOkJYKzrYEjQ55gJCXf/zCd4TUbbnL3yowgq+uMV2Fv6qyBFCOzwkU59
 wj60gRR69TR0LTm2uvLqU09ODYA5CPPM6s288lHs/AYnzLItK0XCuOVO6L666KNE/+1y
 FrheHvdFTn/II2Q7slyLB8hwdaPLIirVqJUhVU8CbsL2LjKGhYdedDIlRHY+d7LfsE5r
 da0/reYa49IqKTLwLkdFC8Ty2WXylvIXhUke5i7XyZvQCnJjuOHTddvXaAPECrpER7fl
 fbqA==
X-Gm-Message-State: AOAM5327379XtYgsyQyMUNSpfbZYPVp1AM1pBfHC3JBcwl7k+YIUETTp
 dclBtk/fpNcqyzORMQZWPCtVgIu4z6F3A5bpFUo=
X-Google-Smtp-Source: ABdhPJzyYg5p3UqVKkZyVIwalh+vXGKgU7JNSKe7ik4pQuYkBCsvb+NhwJoS58H6zchZv33nAdJrAeLAo/rwLwXjU/w=
X-Received: by 2002:a1c:5a56:: with SMTP id o83mr4645269wmb.77.1598406435047; 
 Tue, 25 Aug 2020 18:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200825132839.v2.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
 <752D002CFF5D0F4FA35C0100F1D73F3FA47396E7@ATCPCS16.andestech.com>
In-Reply-To: <752D002CFF5D0F4FA35C0100F1D73F3FA47396E7@ATCPCS16.andestech.com>
From: Rick Chen <rickchen36@gmail.com>
Date: Wed, 26 Aug 2020 09:47:03 +0800
Message-ID: <CAN5B=e+dZHbhTiHx8Bo5Q7Wp1ivur9zbUX7hMSb18ZCc-iZqvA@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: etienne.carriere@st.com, Alan Kao <alankao@andestech.com>,
 Atish Patra <atish.patra@wdc.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, rick <rick@andestech.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com, bryan.odonoghue@linaro.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] fdtdec: optionally add property
 no-map to created reserved memory node
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

PiBGcm9tOiBQYXRyaWNlIENob3RhcmQgW21haWx0bzpwYXRyaWNlLmNob3RhcmRAc3QuY29tXQo+
IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyNSwgMjAyMCA3OjI5IFBNCj4gVG86IHUtYm9vdEBsaXN0
cy5kZW54LmRlCj4gQ2M6IFBhdHJpY2UgQ0hPVEFSRDsgUGF0cmljayBERUxBVU5BWTsgVS1Cb290
IFNUTTMyOyBFdGllbm5lIENhcnJpZXJlOyBBdGlzaCBQYXRyYTsgQmluIE1lbmc7IEJyeWFuIE8n
RG9ub2dodWU7IEhlaW5yaWNoIFNjaHVjaGFyZHQ7IFJpY2sgSmlhbi1aaGkgQ2hlbijpmbPlu7rl
v5cpOyBTaW1vbiBHbGFzcwo+IFN1YmplY3Q6IFtQQVRDSCB2MiAxLzNdIGZkdGRlYzogb3B0aW9u
YWxseSBhZGQgcHJvcGVydHkgbm8tbWFwIHRvIGNyZWF0ZWQgcmVzZXJ2ZWQgbWVtb3J5IG5vZGUK
Pgo+IEZyb206IEV0aWVubmUgQ2FycmllcmUgPGV0aWVubmUuY2FycmllcmVAc3QuY29tPgo+Cj4g
QWRkIGJvb2xlYW4gaW5wdXQgYXJndW1lbnQgQG5vX21hcCB0byBoZWxwZXIgZnVuY3Rpb24KPiBm
ZHRkZWNfYWRkX3Jlc2VydmVkX21lbW9yeSgpIHRvIGFkZCAibm8tbWFwIiBwcm9wZXJ0eSBmb3Ig
YW4gYWRkZWQKPiByZXNlcnZlZCBtZW1vcnkgbm9kZS4gVGhpcyBpcyBuZWVkZWQgZm9yIGV4YW1w
bGUgd2hlbiB0aGUgcmVzZXJ2ZWQKPiBtZW1vcnkgcmVsYXRlcyB0byBzZWN1cmUgbWVtb3J5IHRo
YXQgdGhlIGRlYXIgTGludXgga2VybmVsIHNoYWxsCj4gbm90IGV2ZW4gbWFwIHVubGVzcyB3aGF0
IG5vbi1zZWN1cmUgd29ybGQgc3BlY3VsYXRpdmUgYWNjZXNzZXMgb2YgdGhlCj4gQ1BVIGNhbiB2
aW9sYXRlIHRoZSBtZW1vcnkgZmlybXdhcmUgY29uZmlndXJhdGlvbi4KPgo+IE5vIGZ1bmN0aW9u
IGNoYW5nZS4gQSBsYXRlciBjaGFuZ2Ugd2lsbCB1cGRhdGUgdG8gT1BURUUgbGlicmFyeSB0bwo+
IGFkZCBuby1tYXAgcHJvcGVydHkgdG8gT1AtVEVFIHJlc2VydmVkIG1lbW9yeSBub2Rlcy4KPgo+
IFNpZ25lZC1vZmYtYnk6IEV0aWVubmUgQ2FycmllcmUgPGV0aWVubmUuY2FycmllcmVAc3QuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNv
bT4KPiAgICAtIGZpeCBkbSBmZHRkZWMgdGVzdCBhbmQgYXJjaC9yaXNjdi9saWIvZmR0X2ZpeHVw
LmMgd2l0aAo+ICAgIGZkdGRlY19hZGRfcmVzZXJ2ZWRfbWVtb3J5KCkgbmV3IHBhcmFtZXRlcgo+
Cj4gLS0tCj4KPiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPgo+ICBhcmNoL3Jpc2N2L2xpYi9mZHRf
Zml4dXAuYyB8ICAyICstCj4gIGluY2x1ZGUvZmR0ZGVjLmggICAgICAgICAgIHwgIDUgKysrLS0K
PiAgbGliL2ZkdGRlYy5jICAgICAgICAgICAgICAgfCAxMCArKysrKysrKy0tCj4gIGxpYi9vcHRl
ZS9vcHRlZS5jICAgICAgICAgIHwgIDIgKy0KPiAgdGVzdC9kbS9mZHRkZWMuYyAgICAgICAgICAg
fCAgNiArKystLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQoKQWNrZWQtYnk6IFJpY2sgQ2hlbiA8cmlja0BhbmRlc3RlY2guY29tPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
