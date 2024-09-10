Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E67DB972CDA
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2024 11:05:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 928FFC71290;
	Tue, 10 Sep 2024 09:05:33 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEB3FC57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 09:05:32 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-374bb08d011so3024129f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 02:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725959132; x=1726563932;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYtihAiAeeFUfFq1Wl11n7Hzxiv8L0aqjYTSdZFK0TE=;
 b=eBpzKtnqvwKUlGoVjrbi6hcuKcnrE/EYk6XNpux4k+ZRdJkBWDFJM7GtlhI1G7G6Wa
 LGLHAtYrqkeCjCl7+2b7m9x3v7MzBqxakaWpR+yerwnJ1iKXzddT5HB+/QIePNr3Fi7U
 EZSVfXA5QXGwOXGTQu7PToMiAq9ioabfrPMGGugAgZbpmtCWIbcdbE5dUt3peNbW7i5E
 2OijQb/WW2fCuALYJMiVjEqcWQDBuJtVKTIjWl+3IKnWcU3HqoVnTUppyCnYsTHWPLZ8
 Iu+KBe/q5C8HW7LCHrd5zQ7OhjhtBcCIALJvkH7riVielH9egWp9cBJOhJOJ2SmKydk3
 uAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725959132; x=1726563932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yYtihAiAeeFUfFq1Wl11n7Hzxiv8L0aqjYTSdZFK0TE=;
 b=xMzlM9y1ccDGiMC2z13Da5sfOV/8cO4irB/3LHEvWTsXhzxO3FO3kJ2bOKI3aQsO6P
 AEJ//WgHVwPNbUInBfkPdgGL9BkGQ0yvWPEOdl2XZ3HMBGMzwbN/CnSn74TKKH1E4a54
 PmGjpwb2ACHnWC+Vtj7CvmPFjsqr6RldW7Cv3nKCvRXAfxM5rRttTMJirfhxg3MR/s0Y
 hCwwX1twdpqeq8k6RuWVqcICQsM1OiqXWxMwp90teZVz2mjDRjl//PcwVKEBrIwVhJ6E
 7Ewfa5Ik5r2rcGaSJrG5vnRPGY5OJK5RoYO65t/lclwL+dhh5T3Vo7ohfWyvC27/H/kk
 kLgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+ObI+4Z7YeA8X0OQvHT9VvCEZ+jYkQr5+nZmrYKO2tdm/+v/k8ZVBrKuxu1R85L9tMctkXQlls56Ekg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwrhA6EkvxayzUWfylSLAtlhv9n7PctDn4rrNj2wwIpe42Va2h4
 pKYBJHfE4BmocFfr8lueZAkANUh84byVrJ1YurGja4xLUMORTgHQ0ughzUnxGZlbT3ht6osXiVa
 miUiqa0LeBZBWAF1BG2j5l5fBkGk=
X-Google-Smtp-Source: AGHT+IFxvigfIppQilzwq4BIwn6savRiBvltAk/wDO7iILPosVyDu5/b54dAuUkrTULWSGcjQ7NmMzsaROVCSgE2LX4=
X-Received: by 2002:adf:f8c5:0:b0:374:c8e5:d568 with SMTP id
 ffacd0b85a97d-37889609f21mr7771918f8f.29.1725959131765; Tue, 10 Sep 2024
 02:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
 <CAPVz0n0C6TPdBRUEvJmgAUGAKoetuzr1j=0cMXweP2EqMTwn=g@mail.gmail.com>
 <0910419d-e8ab-4bf9-a083-dc2783afaca1@denx.de>
 <4D07A6E5-F156-44C3-A26D-0F2D913CE92D@gmail.com>
 <18d84528-d2e5-41d6-ae1d-109ee30853b2@denx.de>
 <CAPVz0n2Jzfih0Z85TSQbnz-8OrX4D6UN=anKGTJ=hckRt8f3xA@mail.gmail.com>
 <a95f0d60-2883-4c3d-8a53-ee3ef414cc32@denx.de>
 <CAPVz0n3Ji1sKQK+Lnq8rP3ZqwX3o-kXe2btj93UuVBa3T5C=qw@mail.gmail.com>
 <eced1020-2157-44a4-98a9-845e218529d9@denx.de>
 <45c74c58-98cf-43df-b837-c48b0341c551@denx.de>
 <CAPVz0n2-DCKDcVrAi00kF6yDcE2bN1mtUhzBcw7JDiZoXgzu0w@mail.gmail.com>
 <e5837ce4-0a14-4822-960d-6ab667a9f4b1@denx.de>
In-Reply-To: <e5837ce4-0a14-4822-960d-6ab667a9f4b1@denx.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 10 Sep 2024 12:05:20 +0300
Message-ID: <CAPVz0n323ktF6kb3WHR9JcE+xOzQr9-aWOR47+ZvwQr=ib18rg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 Sumit Garg <sumit.garg@linaro.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] power: regulator: Trigger probe of
 regulators which are always-on or boot-on
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

0L/QvSwgOSDQstC10YAuIDIwMjTigK/RgC4g0L4gMTk6MTMgTWFyZWsgVmFzdXQgPG1hcmV4QGRl
bnguZGU+INC/0LjRiNC1Ogo+Cj4gT24gOC8yMC8yNCA5OjA4IEFNLCBTdnlhdG9zbGF2IFJ5aGVs
IHdyb3RlOgo+ID4g0L/QvSwgMTkg0YHQtdGA0L8uIDIwMjTigK/RgC4g0L4gMjA6MjcgTWFyZWsg
VmFzdXQgPG1hcmV4QGRlbnguZGU+INC/0LjRiNC1Ogo+ID4+Cj4gPj4gT24gOC8xLzI0IDI6Mjgg
QU0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+ID4+PiBPbiA3LzI5LzI0IDE6NTUgUE0sIFN2eWF0b3Ns
YXYgUnloZWwgd3JvdGU6Cj4gPj4+Cj4gPj4+IFsuLi5dCj4gPj4+Cj4gPj4+Pj4+PiBXaGF0IGlz
IHRoZSBwcm9ibGVtIHlvdSBvYnNlcnZlIG9uIHRlZ3JhIDMgPwo+ID4+Pj4+PiBpMmMgbGluZSBm
YWlscyBzaW5jZSBpdCBwcm9iZXMgaW4gc3BsIHdpdGggeW91ciBwYXRjaCwgYnV0IGl0IGRvZXMg
bm90Cj4gPj4+Pj4+IHJlbG9jYXRlIGFuZCB0aGVuIHByb2JlcyBvbmNlIG1vcmUgYWZ0ZXIgcmVs
b2NhdGlvbi4gUHJvYmUgZmFpbHMgYWxvbmcKPiA+Pj4+Pj4gd2l0aCBhbGwgZGV2aWNlcyBvbiBz
YW1lIGxpbmUuCj4gPj4+Pj4KPiA+Pj4+PiBDb3VsZCBpdCBiZSB0aGF0IHlvdSBlaXRoZXIgaGF2
ZSB0bzoKPiA+Pj4+PiAtIEFkZCBETV9JMkMgdG8gdGVncmEgMyBTUEwKPiA+Pj4+PiAtIFJlbW92
ZSBib290cGgtKiBmcm9tIERUIHRvIHJlbW92ZSB0aGUgcmVndWxhdG9yIG5vZGUgZnJvbSBTUEwK
PiA+Pj4+PiAtIC9kZWxldGUtcHJvcGVydHkvIHJlZ3VsYXRvci1hbHdheXMtb247IGFuZCAvZGVs
ZXRlLXByb3BlcnR5Lwo+ID4+Pj4+IHJlZ3VsYXRvci1ib290LW9uOyBpbiAtdS1ib290LmR0c2kg
dG8gcHJldmVudCB0aGUgcmVndWxhdG9yIGZyb20gYmVpbmcKPiA+Pj4+PiBlbmFibGVkIGluIFNQ
TCA/Cj4gPj4+Pj4KPiA+Pj4+IE9idmlvdXNseSBOTywgeW91IHByb3Bvc2Ugbm9uc2Vuc2UuIFNh
bWUgZHRzIGlzIHVzZWQgZm9yIGJvdGggc3RhZ2VzLgo+ID4+Pgo+ID4+PiBEVCBzb3VyY2UgeWVz
LCBEVCBibG9iIGxpa2VseSBuby4KPiA+Pj4KPiA+Pj4+IEFuZCBJIGhhdmUgdG8gYWRkIGhhY2st
aXNoIHN0dWZmIGp1c3QgYmVjYXVzZSB5b3Ugd2FubmEgaW50cm9kdWNlIGNvZGUKPiA+Pj4+IHdo
aWNoIGNhdXNlcyBrbm93biByZWdyZXNzaW9ucy4KPiA+Pj4KPiA+Pj4gSSBhbSB0cnlpbmcgdG8g
dW5kZXJzdGFuZCB3aGF0IHByb2JsZW0gdGhlcmUgaXMgb24gdGVncmEgMywgYnV0IGl0IGlzCj4g
Pj4+IHN0aWxsIG5vdCBjbGVhciB0byBtZS4KPiA+Pj4KPiA+Pj4gSXMgdGhlIHByb2JsZW0gc29t
ZWhvdyByZWxhdGVkIHRvIFBNSUNzICg/KSBiZWluZyBwcm9iZWQgaW4gU1BMICg/KQo+ID4+PiBi
ZWNhdXNlIHRoZXkgaGF2ZSByZWd1bGF0b3JzICg/KSB3aGljaCBhcmUgbWFya2VkIGFzIHJlZ3Vs
YXRvci1hbHdheXMtb24KPiA+Pj4gPyBJZiBzbywgdGhlbiB0aGlzIGlzIGNvcnJlY3QgYmVoYXZp
b3IsIGFuZCBpZiB0aGlzIGlzIG5vdCBkZXNpcmVkIGluCj4gPj4+IFNQTCwgdGhlbiB5b3UgY2Fu
IHJlbW92ZSB0aGlzIHByb3BlcnR5IGZyb20gU1BMIERUIGluIC11LWJvb3QuZHRzaSB1c2luZwo+
ID4+PiAvZGVsZXRlLXByb3BlcnR5LyAuCj4gPj4+Cj4gPj4+IFsuLi5dCj4gPj4+Cj4gPj4+PiAi
V2UgbXVzdCBub3QgcHJvYmUgdGhpbmdzIGFzIHdlIGdvLiBUaGVyZSBtaWdodCBiZSBvdGhlcgo+
ID4+Pj4gZGVwZW5kZW5jaWVzIG5vdCB5ZXQgYm91bmQuIEl0IG1heSBhbHNvIHRha2Ugc29tZSB0
aW1lLiBUaGlzIGlzIG5vdAo+ID4+Pj4gZm9sbG93aW5nIGRyaXZlciBtb2RlbCBkZXNpZ24sIHNv
cnJ5Lgo+ID4+Pj4KPiA+Pj4+IFNvIHBsZWFzZSB0aGluayBvZiBhIHdheSB0byBkbyB0aGlzIHBy
b3Blcmx5LiIKPiA+Pj4KPiA+Pj4gV2hhdCBpcyB0aGlzIHF1b3RlIGFib3V0ID8gV2hlcmUgaXMg
dGhpcyBmcm9tID8KPiA+Pgo+ID4+IFdoYXQgaXMgdGhlIHByb2JsZW0gd2l0aCBUZWdyYSAzIGFu
ZCB0aGlzIHBhdGNoc2V0ID8KPiA+Pgo+ID4+IENhbiB5b3UgcGxlYXNlIGV4cGxhaW4gdGhhdCBz
byB0aGlzIHBhdGNoc2V0IGNhbiBtb3ZlIGZvcndhcmQgPwo+ID4+Cj4gPgo+ID4gd2l0aCB5b3Vy
IGNoYW5nZXMKPiA+Cj4gPiBVLUJvb3QgMjAyNC4wNy0wMDY5Ni1nZTIxN2UyNzY5ZGI5LWRpcnR5
IChBdWcgMjAgMjAyNCAtIDA5OjU1OjI5ICswMzAwKQo+ID4KPiA+IFNvQzogdGVncmExMTQKPiA+
IE1vZGVsOiBOVklESUEgVGVncmEgTm90ZSA3Cj4gPiBCb2FyZDogTlZJRElBIFRlZ3JhVGFiCj4g
PiBEUkFNOiAgMSBHaUIKPiA+IHRlZ3JhX2kyY19wcm9iZTogY2FsbGVkCj4gPiBpMmM6IGNvbnRy
b2xsZXIgYnVzIDAgYXQgNzAwMGQwMDAsIHNwZWVkIDA6IHRlZ3JhX2kyY19wcm9iZTogZXhpdAo+
ID4gaTJjX2luaXRfY29udHJvbGxlcjogc3BlZWQ9NDAwMDAwCj4gPiBpMmNfaW5pdF9jb250cm9s
bGVyOiBDTEtfRElWX1NURF9GQVNUX01PREUgc2V0dGluZyA9IDI1Cj4gPiBpMmNfeGZlcjogMiBt
ZXNzYWdlcwo+ID4gaTJjX3hmZXI6IGNoaXA9MHg1OCwgbGVuPTB4MQo+ID4gaTJjX3dyaXRlX2Rh
dGE6IGNoaXA9MHg1OCwgbGVuPTB4MQo+ID4gd3JpdGVfZGF0YTogIDB4MzcKPiA+IHBrdCBoZWFk
ZXIgMSBzZW50ICgweDEwMDEwKQo+ID4gcGt0IGhlYWRlciAyIHNlbnQgKDB4MCkKPiA+IHBrdCBo
ZWFkZXIgMyBzZW50ICgweDEwMGIwKQo+ID4gcGt0IGRhdGEgc2VudCAoMHgzNykKPiA+IHRlZ3Jh
X2kyY193cml0ZV9kYXRhOiBFcnJvciAoLTEpICEhIQo+ID4gaTJjX3dyaXRlX2RhdGEoKTogcmM9
LTEKPiA+IGkyY193cml0ZTogZXJyb3Igc2VuZGluZwo+ID4gcmVhZCBlcnJvciBmcm9tIGRldmlj
ZTogYmQyNmY4ZTAgcmVnaXN0ZXI6IDB4MzchCj4KPiBUaGlzIHNlZW1zIGxpa2UgdGhlIFBNSUMg
ZHJpdmVyIChwYWxtYXM/KSBpcyB0cnlpbmcgdG8gcmVhZCByZWdpc3Rlcgo+IDB4MzcgUEdPT0Qg
YW5kIHRoZSBJMkMgdHJhbnNmZXIgZmFpbHMgLiBXaHkgZG9lcyB0aGUgSTJDIHRyYW5zZmVyIGZh
aWwgPwoKWW91ICBhcmUgYXNraW5nIG1lPyBCZWNhdXNlIHlvdXIgcGF0Y2hlcyBicmVhayBzb21l
IGltcG9ydGFudCBzZXR1cCBzZXF1ZW5jZS4KUE1JQyBtb2RlbCBkb2VzIG5vdCBtYXR0ZXIsIGFs
bCBiZWhhdmUgc2FtZSB3YXkuCgo+IFlvdSBkaWQgbWVudGlvbiBzb21ldGhpbmcgcmVnYXJkaW5n
IEkyQy9QTUlDIGRyaXZlciBwcm9iZSB0aW1pbmcsIGJ1dCBpdAo+IHNlZW1zIHRoZSBJMkMgZHJp
dmVyIGFuZCBQTUlDIGRyaXZlcnMgcHJvYmUgcm91Z2hseSBhcm91bmQgdGhlIHNhbWUgdGltZQo+
IGluIGJvdGggcGFzcyBhbmQgZmFpbCBjYXNlcyA/CgpZZXMsIGhlcmUgSSBhZ3JlZSB0aGF0IHRo
ZXkgYm90aCBwcm9iZSBhbmQgcHJvYmUgcGFzc2VzLCBidXQgSSBhc3N1bWUKdGltaW5nIG9mIGky
YyBjYWxsIGlzIGNyaXRpY2FsIGFuZCB0aGVyZSBtYXkgYmUgc29tZSBkZXBlbmRlbmN5IHdoaWNo
CmlzIG5vdCByZWFkeS4KCj4gSXQgc2VlbXMgdGhlIHRlZ3JhMyBEVHMgaGF2ZSBtb3N0IG9mIHRo
ZSBQTUlDIHJlZ3VsYXRvcnMgbWFya2VkIGFzCj4gYm9vdC1vbiBhbmQgYWx3YXlzLW9uICwgc28g
ZW5hYmxpbmcgdGhlIHJlZ3VsYXRvcnMgZWFybHkgaXMgdGhlIHJpZ2h0Cj4gdGhpbmcgdG8gZG8u
CgpPbmx5IGVzc2VudGlhbHMgYXJlIGFkZGVkLCB0aHVzIHRoZXkgYXJlIG1hcmtlZCB0aGlzIHdh
eS4KCj4KPiBbLi4uXQo+Cj4gPiBTb0M6IHRlZ3JhMTE0Cj4gPiBNb2RlbDogTlZJRElBIFRlZ3Jh
IE5vdGUgNwo+ID4gQm9hcmQ6IE5WSURJQSBUZWdyYVRhYgo+ID4gRFJBTTogIDEgR2lCCj4gPiB0
ZWdyYV9pMmNfcHJvYmU6IGNhbGxlZAo+ID4gaTJjOiBjb250cm9sbGVyIGJ1cyAwIGF0IDcwMDBk
MDAwLCBzcGVlZCAwOiB0ZWdyYV9pMmNfcHJvYmU6IGV4aXQKPiA+IGkyY19pbml0X2NvbnRyb2xs
ZXI6IHNwZWVkPTQwMDAwMAo+ID4gaTJjX2luaXRfY29udHJvbGxlcjogQ0xLX0RJVl9TVERfRkFT
VF9NT0RFIHNldHRpbmcgPSAyNQo+ID4gcGt0IGhlYWRlciAxIHNlbnQgKDB4MTAwMTApCj4gPiBw
a3QgaGVhZGVyIDIgc2VudCAoMHgwKQo+ID4gcGt0IGhlYWRlciAzIHNlbnQgKDB4YjApCj4gPiBw
a3QgZGF0YSBzZW50ICgweDApCj4gPiBpMmNfeGZlcjogMiBtZXNzYWdlcwo+ID4gaTJjX3hmZXI6
IGNoaXA9MHg1OCwgbGVuPTB4MQo+ID4gaTJjX3dyaXRlX2RhdGE6IGNoaXA9MHg1OCwgbGVuPTB4
MQo+ID4gd3JpdGVfZGF0YTogIDB4ZmIKPiBUaGlzIHNlZW1zIHRvIGJlIGFjY2VzcyB0byByZWdp
c3RlciAweGZiICwgaS5lLiBzb21ldGhpbmcgZWxzZSA/Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
