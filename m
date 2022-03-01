Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F84C8E74
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Mar 2022 15:59:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEC17C5F1ED;
	Tue,  1 Mar 2022 14:59:40 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1019C5EC47
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Mar 2022 14:59:38 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id x193so16506599oix.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Mar 2022 06:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mjb2soW60bQg4tGjSd+oxA+bsLLT5mA5lYyaJrdDiY4=;
 b=JfthOypcbA+TLDBbNnQY7JTgKc/I5+nxf8QcfQYEdzE/9qG/jM5tuWM6/ViXo84tpo
 0g/PZ6amJRmV8wyDV9FhjrLUol8czCFY2IBg1M77ov+0twtYJ7hKLONgB3lfwvYq5Qnq
 yBHbw+5Zm+ULDtsWSkLA/h+wVyyPHtBm1kzq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mjb2soW60bQg4tGjSd+oxA+bsLLT5mA5lYyaJrdDiY4=;
 b=318ru23wslONEEuc0226MQSteZXhMOlGnjtMxRhRVt/giyxXWoWgteYYOhOarmaswD
 NPO/ON4rIjGnqvnPrP3ABvsnLgqzVuPbPczaCPY5BcnE0DMIonN53w0G+x78qvockp2G
 pTJVo/T5rUsrd9A8JAQhDCyY9Hcxrp/SSeRia1+bvsxM7eG7MO+H6oF/gFAA3cKEx4xF
 SAvgGZNseb9qzwGxuyM8HfqX2qhgDXNeW66LmtCjRr+ej6lqMRJcLxABh/50LuniXUAR
 XyrRT1oeXnMt5bLUaqsDRtUZxIV4ickz4viYnhLsII6VTNnL5euojUIKvyW7kuP8luC7
 +XlA==
X-Gm-Message-State: AOAM531y1BTEqHPpPV6KIzN/aUNeo2QiY4P3fmq9DUVwxOs0Vtp8P3vs
 tZgYb/FXv2eTNyf9Ux/tS0h2WeGCsxA8GqAhBBCSXw==
X-Google-Smtp-Source: ABdhPJzhjsA7PQ3nwGKraVyun+tZlMYvexWa/0agjt1HRNYMcWe7N0nqr1OHsyxAcNQ7eHHmixaDZO51ceHiRU/j/r0=
X-Received: by 2002:a05:6808:f88:b0:2d4:c8c2:b898 with SMTP id
 o8-20020a0568080f8800b002d4c8c2b898mr13645725oiw.112.1646146777471; Tue, 01
 Mar 2022 06:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20220112105908.7388-1-patrice.chotard@foss.st.com>
 <CAPnjgZ0rq==OQPJHgfdd_2q58dH2Z+O_E0+KhnD4Ykk9FSLfmg@mail.gmail.com>
 <e4b1c0a9-2dac-f7b7-6a63-a83b6a515566@foss.st.com>
 <CAPnjgZ1mhYfVQrhPju0tPLjFFym_zvnejy=W95HpK7ADzT635A@mail.gmail.com>
 <9eba2ef3-d450-9d7b-6113-2e646d4b016e@foss.st.com>
In-Reply-To: <9eba2ef3-d450-9d7b-6113-2e646d4b016e@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 1 Mar 2022 07:58:40 -0700
Message-ID: <CAPnjgZ00Y-13x3vjP+4aTK9GOQ0071E_v7GZrCehQSH+f1u5RQ@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Vignesh R <vigneshr@ti.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Lukasz Majewski <lukma@denx.de>, Marek Behun <marek.behun@nic.cz>,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Konstantin Porotchkin <kostap@marvell.com>, Biwen Li <biwen.li@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Anji J <anji.jagarlmudi@nxp.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Igal Liberman <igall@marvell.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH] spi: Add spi_get_bus_and_cs() new use_dt
	param
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

SGkgUGF0cmljZSwKCk9uIFR1ZSwgMSBNYXIgMjAyMiBhdCAwMzo0NCwgUGF0cmljZSBDSE9UQVJE
CjxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gSGkgU2ltb24KPgo+IE9u
IDIvMjYvMjIgMTk6MzYsIFNpbW9uIEdsYXNzIHdyb3RlOgo+ID4gSGkgUGF0cmljZSwKPiA+Cj4g
PiBPbiBNb24sIDMxIEphbiAyMDIyIGF0IDA5OjE0LCBQYXRyaWNlIENIT1RBUkQKPiA+IDxwYXRy
aWNlLmNob3RhcmRAZm9zcy5zdC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gSGkgU2ltb24KPiA+Pgo+
ID4+IE9uIDEvMjEvMjIgMTY6MjAsIFNpbW9uIEdsYXNzIHdyb3RlOgo+ID4+PiBIaSBQYXRyaWNl
LAo+ID4+Pgo+ID4+PiBPbiBXZWQsIDEyIEphbiAyMDIyIGF0IDAzOjU5LCBQYXRyaWNlIENob3Rh
cmQKPiA+Pj4gPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gPj4+Pgo+ID4+
Pj4gQWRkIHNwaV9mbGFzaF9wcm9iZV9idXNfY3MoKSBhbmQgc3BpX2dldF9idXNfYW5kX2NzKCkg
bmV3ICJ1c2VfZHQiCj4gPj4+PiBwYXJhbSB3aGljaCBhbGxvd3MgdG8gc2VsZWN0IFNQSSBzcGVl
ZCBhbmQgbW9kZSBmcm9tIERUIG9yIGZyb20KPiA+Pj4+IGRlZmF1bHQgdmFsdWUgcGFzc2VkIGlu
IHBhcmFtZXRlcnMuCj4gPj4+Pgo+ID4+Pj4gU2luY2UgY29tbWl0IGUyZTk1ZTVlMjU0MiAoInNw
aTogVXBkYXRlIHNwZWVkL21vZGUgb24gY2hhbmdlIikKPiA+Pj4+IHdoZW4gY2FsbGluZyAic2Yg
cHJvYmUiIG9yICJlbnYgc2F2ZSIgb24gU1BJIGZsYXNoLAo+ID4+Pj4gc3BpX3NldF9zcGVlZF9t
b2RlKCkgaXMgY2FsbGVkIHR3aWNlLgo+ID4+Pj4KPiA+Pj4+IHNwaV9nZXRfYnVzX2FuZF9jcygp
Cj4gPj4+PiAgICAgICB8LS0+IHNwaV9jbGFpbV9idXMoKQo+ID4+Pj4gICAgICAgfCAgICAgICB8
LS0+IHNwaV9zZXRfc3BlZWRfbW9kZShzcGVlZCBhbmQgbW9kZSBmcm9tIERUKQo+ID4+Pj4gICAg
ICAgLi4uCj4gPj4+PiAgICAgICB8LS0+IHNwaV9zZXRfc3BlZWRfbW9kZShkZWZhdWx0IHNwZWVk
IGFuZCBtb2RlIHZhbHVlKQo+ID4+Pj4KPiA+Pj4+IFRoZSBmaXJzdCBzcGlfc2V0X3NwZWVkX21v
ZGUoKSBjYWxsIGlzIGRvbmUgd2l0aCBzcGVlZCBhbmQgbW9kZQo+ID4+Pj4gdmFsdWVzIGZyb20g
RFQsIHdoZXJlYXMgdGhlIHNlY29uZCBjYWxsIGlzIGRvbmUgd2l0aCBzcGVlZAo+ID4+Pj4gYW5k
IG1vZGUgc2V0IHRvIGRlZmF1bHQgdmFsdWUgKHNwZWVkIGlzIHNldCB0byBDT05GSUdfU0ZfREVG
QVVMVF9TUEVFRCkKPiA+Pj4+Cj4gPj4+PiBUaGlzIGlzIGFuIGlzc3VlIGJlY2F1c2UgU1BJIGZs
YXNoIHBlcmZvcm1hbmNlIGFyZSBpbXBhY3RlZCBieQo+ID4+Pj4gdXNpbmcgZGVmYXVsdCBzcGVl
ZCB3aGljaCBjYW4gYmUgbG93ZXIgdGhhbiB0aGUgb25lIGRlZmluZWQgaW4gRFQuCj4gPj4+Pgo+
ID4+Pj4gT25lIHNvbHV0aW9uIGlzIHRvIHNldCBDT05GSUdfU0ZfREVGQVVMVF9TUEVFRCB0byB0
aGUgc3BlZWQgZGVmaW5lZAo+ID4+Pj4gaW4gRFQsIGJ1dCB3ZSBsb29zZSBmbGV4aWJpbGl0eSBv
ZmZlcmVkIGJ5IERULgo+ID4+Pj4KPiA+Pj4+IEFub3RoZXIgaXNzdWUgY2FuIGJlIGVuY291bnRl
cmVkIHdpdGggMiBTUEkgZmxhc2hlcyB1c2luZyAyIGRpZmZlcmVudAo+ID4+Pj4gc3BlZWRzLiBJ
biB0aGlzIHNwZWNpZmljIGNhc2UgdXNhZ2Ugb2YgQ09ORklHX1NGX0RFRkFVTFRfU1BFRUQgaXMg
bm90Cj4gPj4+PiBmbGV4aWJsZSBjb21wYXJlZCB0byBnZXQgdGhlIDIgZGlmZmVyZW50IHNwZWVk
cyBmcm9tIERULgo+ID4+Pj4KPiA+Pj4+IEJ5IGFkZGluZyBuZXcgcGFyYW1ldGVyICJ1c2VfZHQi
IHRvIHNwaV9mbGFzaF9wcm9iZV9idXNfY3MoKSBhbmQgdG8KPiA+Pj4+IHNwaV9nZXRfYnVzX2Fu
ZF9jcygpLCB0aGlzIGFsbG93cyB0byBmb3JjZSB1c2FnZSBvZiBlaXRoZXIgc3BlZWQgYW5kCj4g
Pj4+PiBtb2RlIGZyb20gRFQgKHVzZV9kdCA9IHRydWUpIG9yIHRvIHVzZSBzcGVlZCBhbmQgbW9k
ZSBwYXJhbWV0ZXIgdmFsdWUuCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBD
aG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gPj4+PiBDYzogTWFyZWsgQmVo
dW4gPG1hcmVrLmJlaHVuQG5pYy5jej4KPiA+Pj4+IENjOiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPiA+Pj4+IENjOiBWaWduZXNoIFIgPHZpZ25lc2hyQHRpLmNvbT4K
PiA+Pj4+IENjOiBKb2UgSGVyc2hiZXJnZXIgPGpvZS5oZXJzaGJlcmdlckBuaS5jb20+Cj4gPj4+
PiBDYzogUmFtb24gRnJpZWQgPHJmcmllZC5kZXZAZ21haWwuY29tPgo+ID4+Pj4gQ2M6IEx1a2Fz
eiBNYWpld3NraSA8bHVrbWFAZGVueC5kZT4KPiA+Pj4+IENjOiBNYXJlayBWYXN1dCA8bWFyZXhA
ZGVueC5kZT4KPiA+Pj4+IENjOiBXb2xmZ2FuZyBEZW5rIDx3ZEBkZW54LmRlPgo+ID4+Pj4gQ2M6
IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+ID4+Pj4gQ2M6IFN0ZWZhbiBSb2VzZSA8
c3JAZGVueC5kZT4KPiA+Pj4+IENjOiAiUGFsaSBSb2jDoXIiIDxwYWxpQGtlcm5lbC5vcmc+Cj4g
Pj4+PiBDYzogS29uc3RhbnRpbiBQb3JvdGNoa2luIDxrb3N0YXBAbWFydmVsbC5jb20+Cj4gPj4+
PiBDYzogSWdhbCBMaWJlcm1hbiA8aWdhbGxAbWFydmVsbC5jb20+Cj4gPj4+PiBDYzogQmluIE1l
bmcgPGJtZW5nLmNuQGdtYWlsLmNvbT4KPiA+Pj4+IENjOiBQcmF0eXVzaCBZYWRhdiA8cC55YWRh
dkB0aS5jb20+Cj4gPj4+PiBDYzogU2VhbiBBbmRlcnNvbiA8c2VhbmdhMkBnbWFpbC5jb20+Cj4g
Pj4+PiBDYzogQW5qaSBKIDxhbmppLmphZ2FybG11ZGlAbnhwLmNvbT4KPiA+Pj4+IENjOiBCaXdl
biBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4KPiA+Pj4+IENjOiBQcml5YW5rYSBKYWluIDxwcml5YW5r
YS5qYWluQG54cC5jb20+Cj4gPj4+PiBDYzogQ2hhaXRhbnlhIFNha2luYW0gPGNoYWl0YW55YS5z
YWtpbmFtQG54cC5jb20+Cj4gPj4+PiAtLS0KPiA+Pj4+Cj4gPj4+PiAgYm9hcmQvQ1ouTklDL3R1
cnJpc19tb3gvdHVycmlzX21veC5jIHwgIDIgKy0KPiA+Pj4+ICBjbWQvc2YuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNSArKysrLQo+ID4+Pj4gIGNtZC9zcGkuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAyICstCj4gPj4+PiAgZHJpdmVycy9tdGQvc3BpL3NmLXVjbGFz
cy5jICAgICAgICAgIHwgIDggKysrKy0tLS0KPiA+Pj4+ICBkcml2ZXJzL25ldC9mbS9mbS5jICAg
ICAgICAgICAgICAgICAgfCAgNSArKystLQo+ID4+Pj4gIGRyaXZlcnMvbmV0L3BmZV9ldGgvcGZl
X2Zpcm13YXJlLmMgICB8ICAyICstCj4gPj4+PiAgZHJpdmVycy9uZXQvc25pX25ldHNlYy5jICAg
ICAgICAgICAgIHwgIDMgKystCj4gPj4+PiAgZHJpdmVycy9zcGkvc3BpLXVjbGFzcy5jICAgICAg
ICAgICAgIHwgIDggKysrKy0tLS0KPiA+Pj4+ICBkcml2ZXJzL3VzYi9nYWRnZXQvbWF4MzQyMF91
ZGMuYyAgICAgfCAgMiArLQo+ID4+Pj4gIGVudi9zZi5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gPj4+PiAgaW5jbHVkZS9zcGkuaCAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDkgKysrKystLS0tCj4gPj4+PiAgaW5jbHVkZS9zcGlfZmxhc2guaCAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KPiA+Pj4+ICB0ZXN0L2RtL3NwaS5jICAgICAgICAgICAgICAgICAgICAgICAg
fCAxNSArKysrKysrKy0tLS0tLS0KPiA+Pj4+ICAxMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRp
b25zKCspLCAyOSBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+Pj4gSSB0aGluayB0aGlzIGlzIGEgZ29v
ZCBpZGVhLCBidXQgc2hvdWxkIHVzZSBhIHNlcGFyYXRlIGZ1bmN0aW9uIG5hbWUKPiA+Pj4gaW5z
dGVhZCBvZiBhZGRpbmcgYW4gYXJndW1lbnQsIHNpbmNlIGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0
byBwYXNzCj4gPj4+IHBhcmFtZXRlcnMgdGhhdCBhcmUgaWdub3JlZC4KPiA+Pgo+ID4+IEkgYW0g
Y29uZnVzZWQsIGRvIHlvdSBtZWFuIGR1cGxpY2F0ZSBzcGlfZmxhc2hfcHJvYmVfYnVzX2NzKCkg
aW4gYW5vdGhlciBmdW5jdGlvbiBzcGlfZmxhc2hfcHJvYmVfYnVzX2NzX2RlZmF1bHQoKQo+ID4+
IGZvciBleGFtcGxlID8KPiA+PiBJbiB0aGUgZm9ybWVyIHNwaV9nZXRfYnVzX2FuZF9jcygpIHdp
bGwgYmUgY2FsbGVkIHdpdGggInVzZV9kdCIgcGFyYW0gc2V0IHRvIHRydWUgYW5kIGluIHRoZSBs
YXR0ZXIKPiA+PiAidXNlX2R0IiBwYXJhbSB3aWxsIGJlIHNldCB0byBmYWxzZSA/Cj4gPj4KPiA+
PiBzcGlfZmxhc2hfcHJvYmVfYnVzX2NzKCkgICAgICAgICA9PiBzcGlfZ2V0X2J1c19hbmRfY3Mo
Li4sIHRydWUgLCAuLi4pCj4gPj4gc3BpX2ZsYXNoX3Byb2JlX2J1c19jc19kZWZhdWx0KCkgPT4g
c3BpX2dldF9idXNfYW5kX2NzKC4uLCBmYWxzZSwgLi4uKQo+ID4KPiA+IE1heWJlIHJlbmFtZSBz
cGlfZ2V0X2J1c19hbmRfY3MoKSB0byBfc3BpX2dldF9idXNfYW5kX2NzKCkgPwo+ID4KPiA+IEl0
IHNlZW1zIHRvIG1lIHRoYXQgaWYgdXNlX2R0IGlzIHByb3ZpZGVkLCB3ZSBzaG91bGQgYWN0dWFs
bHkgYmUgdXNpbmcKPiA+IERUIGFuZCBub3QgY2FsbGluZyB0aGlzIGZ1bmN0aW9uIGF0IGFsbC4g
V2Ugc2hvdWxkIGp1c3QgYmUgYWJsZSB0bwo+ID4gcHJvYmUgdGhlIGRldmljZSBhbmQgdGhlIHJp
Z2h0IHRoaW5ncyBzaG91bGQgaGFwcGVuLgo+ID4KPiA+IElmIHdlIG11c3QgdXNlIHRoZSBidXMg
YW5kIGNzIG51bWJlcnMsIGFuZCB1c2VfZHQgaXMgdHJ1ZSwgdGhlbiB3ZQo+ID4gc2hvdWxkIG5v
dCBuZWVkIHRvIHNwZWNpZnkgdGhlIG1vZGUsIHNwZWVkLCBldGMuIFNvIHRoZSBhcmdzIHRvIHRo
YXQKPiA+IGZ1bmN0aW9uIHNob3VsZCBiZSBkaWZmZXJlbnQuCj4gPgo+ID4gU28gSSBiZWxpZXZl
IHRoZSB0d28gZnVuY3Rpb25zIHNob3VsZCBoYXZlIHF1aXRlIGRpZmZlcmVudCBhcmdzLgo+ID4g
UGVyaGFwcyB0aGUgY29yZSBwYXJ0IG9mIHNwaV9nZXRfYnVzX2FuZF9jcygpIGNvdWxkIGJlIHNw
bGl0IG91dD8gSQo+ID4ganVzdCBmZWVsIHRoZXJlIGFyZSB3YXkgdG9vIG1hbnkgYXJndW1lbnRz
IGFuZCBhZGRpbmcgYW4gYXJndW1lbnQgdGhhdAo+ID4gY2FuY2VscyBvdXQgc29tZSBvZiB0aGUg
b3RoZXJzIGp1c3QgbWFrZXMgYSBjb25mdXNpbmcgbWVzcy4KPgo+IFRoYW5rcyBmb3IgY2xhcmlm
aWNhdGlvbiwgaSB1bmRlcnN0YW5kIG5vdyB3aGF0IHlvdSBleHBlY3QuCj4KPiA+Cj4gPj4KPiA+
PiBUaGFua3MKPiA+PiBQYXRyaWNlCj4gPj4+Cj4gPj4+IEFsc28gd2Ugc2hvdWxkIHByb2JhYmx5
IGhhdmUgZGV2aWNldHJlZSBhcyB0aGUgZGVmYXVsdCAodGhlIGJhc2UgZnVuY3Rpb24gbmFtZSku
Cj4gPj4+Cj4gPgo+ID4gU2VlIHRoYXQgYWxzbyBeCj4KPiBZb3UgbWVhbiB0aGF0IHNwaV9nZXRf
YnVzX2FuZF9jcygpIHdpbGwgaW1wbHkgdXNpbmcgZGV2aWNlIHRyZWUgYnkgZGVmYXVsdCA/CgpZ
ZXMgSSB0aGluayB0aGF0IG1ha2VzIHNlbnNlLCBiZWNhdXNlIHdlIHdhbnQgdGhlIG5vbi1kdCBw
YXRoIHRvIGJlCnRoZSBleGNlcHRpb24uCgpSZWdhcmRzLApTaW1vbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
