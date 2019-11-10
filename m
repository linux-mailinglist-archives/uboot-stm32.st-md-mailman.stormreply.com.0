Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC79CF6B43
	for <lists+uboot-stm32@lfdr.de>; Sun, 10 Nov 2019 21:19:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E0F7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sun, 10 Nov 2019 20:19:24 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A557FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Nov 2019 20:19:21 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id q5so2192922lfo.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Nov 2019 12:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BB9cQC4K7FifjfaqgHH7PUpDG0Xc0/ojT3Tv3c3BiP4=;
 b=kw3gDV1nt4fjyg4+9rGTET6FF+cw0HJtEk9ficUkrjW86wA8C12H+oM3vmDnJhSjLu
 8Mt4RAMNmV270eC1MJuBBWobTyFw/9vmqjV32xPubjH1dIM8QSWKyuFSgi8KdNzMwHcX
 uf+vUS7c38/UHSmnCqLLWCiKc6jkKTroWd1jBn1U0iTXQfjR/NuCSU91Kz0UfSfj7qsd
 RDZNgTY57EkzBxhjd6BaHTtK+b7ediy4CdHaaLPC6EamU4j3Q3ajKNQAmMlp4smbg5u8
 fPktQZ6d0hfMqlc2IHsS7pH0X6g4u09Qdifcj723LUeOj5w3ohpxekobLY3j55hjQfj8
 rqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BB9cQC4K7FifjfaqgHH7PUpDG0Xc0/ojT3Tv3c3BiP4=;
 b=jwhrVUkSyX5giWi/LAuLZHAAAco6HxjBpJea7KQp01hKCx2/K6IMsZ1dXosrHcu+1W
 qJRy2JkR5HrrlrXcrnrMIFwEmeY5AR6+/lnl8P2hRqsILRd5oMpfixsno2lbi0/gkEGu
 rD9EJLSZhOSsZayN9wlp/N0ioD3t0fEgV0GtNzKTeWO+3ub5nnUxVGZHtCYchf+Tc0I2
 K7Gjv0N7VsbDbtWfVZfAiSCIFI4MUA+h55TJsfzn18Wv4DQz2SB5Ci4jJxEF5CS7+vIi
 xMOO7K/x6dyx/8PDpvEO1CV+s+Q1Tuo7v2YSv6+T4diTda531LJnTQ96lde3PkdXAX2W
 oiKQ==
X-Gm-Message-State: APjAAAXQj75hYyvBzuJgY07IUOga2qUaAOqqbSL99P8fZNMdh7RjN2jD
 9AsrVbHgycdP958Bsp4zmZd2cQxT8LglIrfDVqk=
X-Google-Smtp-Source: APXvYqxy5Ly1VHiafPhlfZ26T7zwYaRhkJ4S29cwBlaZ35eC9vlSludJrrpmVRuvwb6fj0b8pAd/lhzzeuAM+8F+RNc=
X-Received: by 2002:a19:be92:: with SMTP id o140mr13346297lff.40.1573417159959; 
 Sun, 10 Nov 2019 12:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20191108144716.23829-1-patrick.delaunay@st.com>
 <507210dc-a047-8f33-873c-fb336e1f8ba0@denx.de>
 <CAAh8qsySU816FAqcjmvqsu_Rx6Yy-pk7yHHLsqkMhhrqsFPBzA@mail.gmail.com>
 <CAKOfRZy664kidMXmXMk4ps_t-cU_25Ut-nxrL8NMm9F24CAAwQ@mail.gmail.com>
In-Reply-To: <CAKOfRZy664kidMXmXMk4ps_t-cU_25Ut-nxrL8NMm9F24CAAwQ@mail.gmail.com>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Date: Sun, 10 Nov 2019 21:19:07 +0100
Message-ID: <CAAh8qsyyc3xuMa=ykGCOyEjon9KWaU8hZ7ussa26yEgkX7m_=w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay73@gmail.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 0/4] usb: host: dwc2: use
 driver model for PHY and CLOCK
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

T24gU2F0LCBOb3YgOSwgMjAxOSBhdCA0OjQ2IFBNIFBhdHJpY2sgRGVsYXVuYXkKPHBhdHJpY2su
ZGVsYXVuYXk3M0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgTWFyZWssCj4KPiBNeSBjaSB0cmF2
aXMgYnVpbGQgaXMgZmFpbGluZyBhZnRlciB0aGUgbGFzdCB1cGRhdGVzIChyYXNwYmVycnkgcGkp
LiBJIGFtIHRlc3RpbmcgYSB1cGRhdGUgd2l0aCBzdWIgZm9yIGNsayBkaXNhYmxlIGJ1bGsgZnVu
Y3Rpb246Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vcGF0cmlja2RlbGF1bmF5L3UtYm9vdC9jb21t
aXQvMWQwNTNkZDk2ZTY2MjNkMDJiODQ2NTQzOTg2NTVhNTU2M2NjZmRjYgo+Cj4gTm93IGJ1aWtk
IGlzIG9rOgo+IGh0dHBzOi8vdHJhdmlzLWNpLm9yZy9wYXRyaWNrZGVsYXVuYXkvdS1ib290L2J1
aWxkcy82MDk0OTYxODcKPgo+IEkgd2lsbCBwdXNoIGl0IGFmdGVyIHRoZSBXZWVrIGVuZCAodHVl
c2RheSkuCgpXaXRoIHRoYXQgYWRkaXRpb25hbCBjaGFuZ2UsIGl0IHNlZW1zIHRvIGJ1aWxkIGFu
ZCB3b3JrIGZvciBtZSAoc2FtZSBlcnJvcgptZXNzYWdlIHNheWluZyBVU0IgIlBvcnQgbm90IGF2
YWlsYWJsZSIgdGhhbiB3aXRob3V0IHRoaXMgcGF0Y2gpLgoKUmVnYXJkcywKU2ltb24KCj4KPiBT
b3JyeS4KPgo+IFBhdHJpY2suCj4KPgo+Cj4gTGUgdmVuLiA4IG5vdi4gMjAxOSDDoCAxNjo1NSwg
U2ltb24gR29sZHNjaG1pZHQgPHNpbW9uLmsuci5nb2xkc2NobWlkdEBnbWFpbC5jb20+IGEgw6lj
cml0IDoKPj4KPj4gTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+IHNjaHJpZWIgYW0gRnIuLCA4
LiBOb3YuIDIwMTksIDE2OjQ2Ogo+Pgo+PiA+IE9uIDExLzgvMTkgMzo0NyBQTSwgUGF0cmljayBE
ZWxhdW5heSB3cm90ZToKPj4gPiA+Cj4+ID4gPiBJbiB0aGlzIHNlcmllIEkgdXBkYXRlIHRoZSBE
V0MyIGhvc3QgZHJpdmVyIHRvIHVzZSB0aGUgZGV2aWNlIHRyZWUKPj4gPiA+IGluZm9ybWF0aW9u
IGFuZCB0aGUgYXNzb2NpYXRlZCBQSFkgYW5kIENMT0NLIGRyaXZlcnMgd2hlbiB0aGV5IGFyZQo+
PiA+ID4gYXZhaWxhYmxlLgo+PiA+Cj4+ID4gSSdtIGtpbmRhIG9uIHRoZSBmZW5jZSB3aGV0aGVy
IHRvIGFkZCBpdCBpbnRvIGN1cnJlbnQgcmVsZWFzZSBvciBub3QuCj4+ID4gVGhlIHBhdGNoZXMg
bG9vayBnZW5lcmFsbHkgT0sgdG8gbWUuCj4+ID4KPj4gPiBMZXksIFNpbW9uLCBjYW4geW91IGNo
ZWNrIHRoaXMgb24gU29DRlBHQSA/Cj4+ID4KPj4KPj4gR21tLCBzbyBjYW4gdHJ5LCBidXQgSSBk
b24ndCBoYXZlIGEgd29ya2luZyBzZXR1cCB3aXRoIFVTQiBwZXJpcGhlcmFscwo+PiBhdHRhY2hl
ZC4uLiBJIGRvIGhhdmUgVVNCIG9uIHRoZSBzb2NyYXRlcywgYnV0IGN1cnJlbnRseSBubyBjYWJs
ZSB0bwo+PiBjb25uZWN0IGFueXRoaW5nLi4uCj4+Cj4+IEkgY291bGQgdGVzdCBpdCB0byBzZWUg
aWYgSSBjYW4gZ2V0IHRoZSBzYW1lIHJlc3VsdCBzYXlpbmcgbm8gYXR0YWNoZWQKPj4gZGV2aWNl
cyBhcmUgZm91bmQsIHRoYXQgd291bGQgbWVhbiBwcm9iaW5nIHN0aWxsIHdvcmtzIGNvcnJlY3Rs
eS4uLgo+Pgo+PiBSZWdhcmRzLAo+PiBTaW1vbgo+Pgo+PiBCaW4sIGNhbiB5b3UgZ2l2ZSBpdCBh
IG9uY2Utb3ZlciA/Cj4+ID4KPj4gPiBJZiB0aGlzIGxvb2tzIE9LIHRvIHlvdSwgSSB3aWxsIGFk
ZCBpdC4KPj4gPgo+PiA+IFsuLi5dCj4+ID4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gVS1Cb290IG1haWxpbmcgbGlzdAo+PiBVLUJvb3RAbGlz
dHMuZGVueC5kZQo+PiBodHRwczovL2xpc3RzLmRlbnguZGUvbGlzdGluZm8vdS1ib290Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
