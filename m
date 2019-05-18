Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C322411
	for <lists+uboot-stm32@lfdr.de>; Sat, 18 May 2019 18:20:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30D64C16368
	for <lists+uboot-stm32@lfdr.de>; Sat, 18 May 2019 16:20:20 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05543C16365
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 May 2019 16:20:18 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id g18so9403141otj.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 May 2019 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QwQVfLOPK5vfMbFHSWB+x5l5o2W96xgdDOco6afYodo=;
 b=D8xujwTucjlU9AAwBjH+BPDKGts5rR2W0mslo8YLhtUkhebx7Mi0vKP95Q/GRClRb7
 R7d8F12YFTTGaLJaAI0HO6NCiBY1WLn1TP3cC0FUTBsOK1P6y6eNe7On2XgL668gIZS3
 OolVqOHjBDZpqumow6UkTDRHxOMw6cRkRIVYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QwQVfLOPK5vfMbFHSWB+x5l5o2W96xgdDOco6afYodo=;
 b=cOGe6ltbh77E5lIMkn2PB6c7LAgub4F5T6DRbWxTD7LF2gtr+ixTT2xlDoK3IJxAuT
 HNtFG7N9P+qv+1rbNBAbf8oPRWryjH1JBpj28SRWwHptjExLHOXlUBns3KJHrRIc5G61
 ubEsoFMYqCwv1NuCvysd5+CdnLY+iNpJBuFg4YW/tQkxeX6RSJoD/P6vbf+uDx5CTpaQ
 +yiaaJnXI1rF2eAUVAb7+Yy5LxtokP6V3yj1e1qdRlprrgh7ceqAL1jmoaC/p/xIE/0w
 Xff0RoYPEQnXTfIqvU7D114Pe59BVTor8YgysIEMdxnS7o46cUoWyARC9GCNc4xCsqeM
 bjgg==
X-Gm-Message-State: APjAAAXyWvDesNjmC0FT9dsLoGhTL9gYTq60X+PwbhaSK7csZv4lUXLB
 Tv95lFkEWClgVIDYXGkYZe5Mo8ycOaTkuMa1ecza/A==
X-Google-Smtp-Source: APXvYqxUIcY7sw/+ASde1+F7NwIbVY6bBebN8C+Ap9IeH+mQuKSEU+0wvEEM2p5xTF7EB9ocr/DuAcoETObP1q50x84=
X-Received: by 2002:a9d:400d:: with SMTP id m13mr2926471ote.100.1558196417300; 
 Sat, 18 May 2019 09:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <1549275292-3134-1-git-send-email-patrick.delaunay@st.com>
 <CAPnjgZ02cTKAp5GNPMGEMUPkhw74dFF620-4Z3MLS_ADhpcf6g@mail.gmail.com>
 <53f1641f-7c55-9a34-8655-7bc41bc01d26@denx.de>
 <0e9b24dbc05f49308306a4bf9db948a7@SFHDAG6NODE3.st.com>
 <13efb4ac-ef65-ea70-d2a1-47a804091efa@denx.de>
 <0f3d9121c5e946fb9758681a0a3ce3e3@SFHDAG6NODE3.st.com>
 <7b9ebc03-2f5d-8ac7-cb0c-ceea5b99093b@denx.de>
 <c7301e129cda446fb209944908388118@SFHDAG6NODE3.st.com>
In-Reply-To: <c7301e129cda446fb209944908388118@SFHDAG6NODE3.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 18 May 2019 10:20:05 -0600
Message-ID: <CAPnjgZ3oiY4FTs9qq0O5iO8bysks7xpY-VQz7XB-pBafRsM0gQ@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] fdt: Allow indicating a node is for
	U-Boot proper only
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

SGkgUGF0cmljaywKCk9uIE1vbiwgMTEgRmViIDIwMTkgYXQgMDc6MzQsIFBhdHJpY2sgREVMQVVO
QVkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPiB3cm90ZToKPgo+IEhpIE1hcmVrLAo+Cj4gPiBG
cm9tOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPiA+IFNlbnQ6IGx1bmRpIDExIGbDqXZy
aWVyIDIwMTkgMTI6NTgKPiA+Cj4gPiBPbiAyLzExLzE5IDEyOjU2IFBNLCBQYXRyaWNrIERFTEFV
TkFZIHdyb3RlOgo+ID4gPiBIaSBNYXJlayBhbmQgU2ltb24KPiA+ID4KPiA+ID4+IEZyb206IFBh
dHJpY2sgREVMQVVOQVkKPiA+ID4+IFNlbnQ6IHZlbmRyZWRpIDggZsOpdnJpZXIgMjAxOSAxMzo0
Nwo+ID4gPj4KPiA+ID4+IEhpIE1hcmVrLAo+ID4gPj4KPiA+ID4+PiBGcm9tOiBNYXJlayBWYXN1
dCA8bWFyZXhAZGVueC5kZT4KPiA+ID4+PiBTZW50OiBqZXVkaSA3IGbDqXZyaWVyIDIwMTkgMTg6
NDgKPiA+ID4+Pgo+ID4gPj4+IE9uIDIvNy8xOSA2OjQwIFBNLCBQYXRyaWNrIERFTEFVTkFZIHdy
b3RlOgo+ID4gPj4+PiBIaSBNYXJlaywKPiA+ID4+Pj4KPiA+ID4+Pj4+IEZyb206IE1hcmVrIFZh
c3V0IDxtYXJleEBkZW54LmRlPgo+ID4gPj4+Pj4gU2VudDogbWFyZGkgNSBmw6l2cmllciAyMDE5
IDA5OjU1Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gT24gMi80LzE5IDM6NDAgUE0sIFNpbW9uIEdsYXNz
IHdyb3RlOgo+ID4gPj4+Pj4+IE9uIE1vbiwgNCBGZWIgMjAxOSBhdCAwMzoxNSwgUGF0cmljayBE
ZWxhdW5heQo+ID4gPj4+Pj4+IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4KPiA+ID4+Pj4+IHdy
b3RlOgo+ID4gPj4+Pj4+Pgo+ID4gPj4+Pj4+PiBUaGlzIGFkZCBtaXNzaW5nIHBhcnRzIGZvciBw
cmV2aW91cyBjb21taXQgMDZmOTQ0NjFhOWY0Cj4gPiA+Pj4+Pj4+ICgiZmR0OiBBbGxvdyBpbmRp
Y2F0aW5nIGEgbm9kZSBpcyBmb3IgVS1Cb290IHByb3BlciBvbmx5IikKPiA+ID4+Pj4+Pj4KPiA+
ID4+Pj4+Pj4gQXQgcHJlc2VudCBpdCBpcyBub3QgcG9zc2libGUgdG8gc3BlY2lmeSB0aGF0IGEg
bm9kZSBzaG91bGQgYmUKPiA+ID4+Pj4+Pj4gdXNlZCBiZWZvcmUgcmVsb2NhdGlvbiAoaW4gVS1C
b290IHByb3Blcikgd2l0aG91dCBpdCBhbHNvIGVuZGluZwo+ID4gPj4+Pj4+PiB1cCBpbiBTUEwg
YW5kIFRQTCBkZXZpY2UgdHJlZXMuIEFkZCBhIG5ldyAidS1ib290LGRtLXByZS1wcm9wZXIiCj4g
PiA+Pj4+Pj4+IGJvb2xlYW4gcHJvcGVydHkKPiA+ID4+Pj4+IGZvciB0aGlzLgo+ID4gPj4+Pj4+
Pgo+ID4gPj4+Pj4+Pgo+ID4gPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5
IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4KPiA+ID4+Pj4+Pgo+ID4gPiAuLi4KPiA+ID4+Pj4g
TkI6IHdlIGNvdWxkIGFsc28gcmVtb3ZlIHRoZSB0YWdzIHUtYm9vdCxkbS1wcmUtcmVsb2MvdS1i
b290LGRtLXNwbAo+ID4gPj4+PiA6IHdlCj4gPiA+Pj4gY2FuIGdhaW4gcGxhY2UgaW4gc3BsIGR0
Ygo+ID4gPj4+PiAgICAgICAgVGhlc2UgdGFncyBhcmUgbm90IG5lZWRlZCBhcyBiaW5kaW5nIGlz
IG1hbmRhdG9yeSBpbiBTUEwKPiA+ID4+Pj4gYnVpbGQgZm9yIEFMTAo+ID4gPj4+IG5vZGUgIHBy
ZXNlbnQgaW4gU1BMIGRldmljZSB0cmVlCj4gPiA+Pj4+ICAgICAgIG90aGVycyBub2RlIGFyZSBj
bGVhbmVkIGJ5IGZkdGdyZXAgKGJ1dCBpbXBhY3QgaW4gU1BMIGNvZGUpCj4gPiA+Pgo+ID4gPj4g
RmluYWxseSBJIHdpbGwgc2VudCBhIHBhdGNoIGZvciB0aGlzIHByb3Bvc2FsICh0b2RheSBJIGhv
cGUpID0+IE9uIG15Cj4gPiA+PiBib2FyZCBzdG0zMm1wMS1ldjEsIHRoZSBTUEwgZGV2aWNlIHRy
ZWUgaXMgcmVkdWNlZCBieSA3OTAgYnl0ZXMKPiA+ID4KPiA+ID4gRllJOiBwYXRjaCBzZW50IHdp
dGggaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3BhdGNoLzEwMzk3NTYvCgpUaGF0IHBhdGNo
IHdhcyBhcHBsaWVkLgoKQnV0IHdoYXQgaXMgdGhlIHN0YXR1cyBvZiB0aGlzIHBhdGNoLCBhbmQg
dGhlIHNlY29uZCBvbmUgaW4gdGhpcyBzZXJpZXM/CgpJZiB0aGVzZSBhcmUgc3RpbGwgbmVlZGVk
IGNhbiB5b3UgcGxlYXNlIHJlc2VuZCB0aGVtLCByZWJhc2VkPwoKUmVnYXJkcywKU2ltb24KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIg
bWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qt
c3RtMzIK
