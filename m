Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A59749FB
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Sep 2024 07:57:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BB5BC78015;
	Wed, 11 Sep 2024 05:57:43 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 905EDC78011
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 05:57:36 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-374ca65cafdso3991530f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 22:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726034256; x=1726639056;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ci7Sh7Rbd+SVhhhd1ILEPS+FX7FpOkwS7zhU9KE2Rvg=;
 b=XwkZBFMTSiDc5HXTCOfAHNaaxsP6O0DSoHLNc5ksKx/Jv7d9WZ7SnCiGl9HRm4O13G
 0exJTBQyxo7JOYoQFyRliDX5fADXzZjue+3H07Ufhsz8I1SrTJaZPvBLnqY0BvjoOnPD
 /AIo7KTVE69TB3tjhFE9AMg8UZt2pTe5DQW4xXYBM0pKZq+ECrfJOa6+aO/6UAt1NBmK
 znDOR/WPz/a2DhyfRzE8zH3yAUH9RapushfRyOhPwQql0TSY6MDXAbDGVmySMAsyu+K1
 Gf1aTxkMaYt1w4JRDgnkmCnY9XbNarei+HVt3RmYqjAIeIGtDusKDCM+A269iJhjE8fX
 iJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726034256; x=1726639056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ci7Sh7Rbd+SVhhhd1ILEPS+FX7FpOkwS7zhU9KE2Rvg=;
 b=piEahxLolQjd0tXUrW0J5HK6mUb5MVdgiphX6O3GijBc8boRD1M28Np6Bug5P5vxZS
 13UAojJNkb/k+DkSzIK5PbINrNTveIzuTRkUkWhI3yTSRx6LtYvDc+FUSCx+Oke6dIDb
 ozTG5wxeAgZFCXArQFmSQ1ImUVGe15ZFIdY1kdgKceyPARe8RBBe+JOFyemK5ppqiEbv
 mH/JH2AR/tlqxMoDQVj6EIw2hPyf9/Urxu9HEonL1qjoBc/U3GxMIJvEE2+LLPn6k89j
 i0dl1v5xj54olLQwEUcSMPgalTELJsW8qpo6GnUU8B0732Mh0ImgoJSv9nJt8MBtKrHr
 ovTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ0yRUYblnULGNI/n/TQjme0ATPIKeDWgKad2f9KQdiNDT2ve0SajBR54E2RQ5zsLchT3Cv8FA/leXgg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyALChCEMH7vBOjFecQ4TtOFqb3/45CrOxQ44v0CHtbL76Rwqg3
 TOD0HYkZXSFtkQCzgn0DU5dsI1IyRRfw/kvVwZFPAL3Nqi+dN0K3Iqwn/kWgYst52xARWu31A2w
 R198KN98D6dbn9xgL491kF+UXH00=
X-Google-Smtp-Source: AGHT+IFUaPdosA69uIGhkBmZFZfbdY1akrfVVyg0z117C+PYnGTjX2RNypXAyn5+wCduZ2DKDDuWx2QQe15xiH6uI6w=
X-Received: by 2002:adf:f6c9:0:b0:374:c3f7:6af1 with SMTP id
 ffacd0b85a97d-378949f7897mr7911355f8f.15.1726034255623; Tue, 10 Sep 2024
 22:57:35 -0700 (PDT)
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
 <CAPVz0n323ktF6kb3WHR9JcE+xOzQr9-aWOR47+ZvwQr=ib18rg@mail.gmail.com>
 <f778366b-bdaf-415d-a94e-c995f62e8c71@denx.de>
In-Reply-To: <f778366b-bdaf-415d-a94e-c995f62e8c71@denx.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 11 Sep 2024 08:57:24 +0300
Message-ID: <CAPVz0n0ru1rPb9SNw515mkwfs4=nNSOPjZY74JVkqnGbEouSLQ@mail.gmail.com>
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

0LLRgiwgMTAg0LLQtdGALiAyMDI04oCv0YAuINC+IDEzOjE4IE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPiDQv9C40YjQtToKPgo+IE9uIDkvMTAvMjQgMTE6MDUgQU0sIFN2eWF0b3NsYXYgUnlo
ZWwgd3JvdGU6Cj4gPiDQv9C9LCA5INCy0LXRgC4gMjAyNOKAr9GALiDQviAxOToxMyBNYXJlayBW
YXN1dCA8bWFyZXhAZGVueC5kZT4g0L/QuNGI0LU6Cj4gPj4KPiA+PiBPbiA4LzIwLzI0IDk6MDgg
QU0sIFN2eWF0b3NsYXYgUnloZWwgd3JvdGU6Cj4gPj4+INC/0L0sIDE5INGB0LXRgNC/LiAyMDI0
4oCv0YAuINC+IDIwOjI3IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPiDQv9C40YjQtToKPiA+
Pj4+Cj4gPj4+PiBPbiA4LzEvMjQgMjoyOCBBTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gPj4+Pj4g
T24gNy8yOS8yNCAxOjU1IFBNLCBTdnlhdG9zbGF2IFJ5aGVsIHdyb3RlOgo+ID4+Pj4+Cj4gPj4+
Pj4gWy4uLl0KPiA+Pj4+Pgo+ID4+Pj4+Pj4+PiBXaGF0IGlzIHRoZSBwcm9ibGVtIHlvdSBvYnNl
cnZlIG9uIHRlZ3JhIDMgPwo+ID4+Pj4+Pj4+IGkyYyBsaW5lIGZhaWxzIHNpbmNlIGl0IHByb2Jl
cyBpbiBzcGwgd2l0aCB5b3VyIHBhdGNoLCBidXQgaXQgZG9lcyBub3QKPiA+Pj4+Pj4+PiByZWxv
Y2F0ZSBhbmQgdGhlbiBwcm9iZXMgb25jZSBtb3JlIGFmdGVyIHJlbG9jYXRpb24uIFByb2JlIGZh
aWxzIGFsb25nCj4gPj4+Pj4+Pj4gd2l0aCBhbGwgZGV2aWNlcyBvbiBzYW1lIGxpbmUuCj4gPj4+
Pj4+Pgo+ID4+Pj4+Pj4gQ291bGQgaXQgYmUgdGhhdCB5b3UgZWl0aGVyIGhhdmUgdG86Cj4gPj4+
Pj4+PiAtIEFkZCBETV9JMkMgdG8gdGVncmEgMyBTUEwKPiA+Pj4+Pj4+IC0gUmVtb3ZlIGJvb3Rw
aC0qIGZyb20gRFQgdG8gcmVtb3ZlIHRoZSByZWd1bGF0b3Igbm9kZSBmcm9tIFNQTAo+ID4+Pj4+
Pj4gLSAvZGVsZXRlLXByb3BlcnR5LyByZWd1bGF0b3ItYWx3YXlzLW9uOyBhbmQgL2RlbGV0ZS1w
cm9wZXJ0eS8KPiA+Pj4+Pj4+IHJlZ3VsYXRvci1ib290LW9uOyBpbiAtdS1ib290LmR0c2kgdG8g
cHJldmVudCB0aGUgcmVndWxhdG9yIGZyb20gYmVpbmcKPiA+Pj4+Pj4+IGVuYWJsZWQgaW4gU1BM
ID8KPiA+Pj4+Pj4+Cj4gPj4+Pj4+IE9idmlvdXNseSBOTywgeW91IHByb3Bvc2Ugbm9uc2Vuc2Uu
IFNhbWUgZHRzIGlzIHVzZWQgZm9yIGJvdGggc3RhZ2VzLgo+ID4+Pj4+Cj4gPj4+Pj4gRFQgc291
cmNlIHllcywgRFQgYmxvYiBsaWtlbHkgbm8uCj4gPj4+Pj4KPiA+Pj4+Pj4gQW5kIEkgaGF2ZSB0
byBhZGQgaGFjay1pc2ggc3R1ZmYganVzdCBiZWNhdXNlIHlvdSB3YW5uYSBpbnRyb2R1Y2UgY29k
ZQo+ID4+Pj4+PiB3aGljaCBjYXVzZXMga25vd24gcmVncmVzc2lvbnMuCj4gPj4+Pj4KPiA+Pj4+
PiBJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5kIHdoYXQgcHJvYmxlbSB0aGVyZSBpcyBvbiB0ZWdy
YSAzLCBidXQgaXQgaXMKPiA+Pj4+PiBzdGlsbCBub3QgY2xlYXIgdG8gbWUuCj4gPj4+Pj4KPiA+
Pj4+PiBJcyB0aGUgcHJvYmxlbSBzb21laG93IHJlbGF0ZWQgdG8gUE1JQ3MgKD8pIGJlaW5nIHBy
b2JlZCBpbiBTUEwgKD8pCj4gPj4+Pj4gYmVjYXVzZSB0aGV5IGhhdmUgcmVndWxhdG9ycyAoPykg
d2hpY2ggYXJlIG1hcmtlZCBhcyByZWd1bGF0b3ItYWx3YXlzLW9uCj4gPj4+Pj4gPyBJZiBzbywg
dGhlbiB0aGlzIGlzIGNvcnJlY3QgYmVoYXZpb3IsIGFuZCBpZiB0aGlzIGlzIG5vdCBkZXNpcmVk
IGluCj4gPj4+Pj4gU1BMLCB0aGVuIHlvdSBjYW4gcmVtb3ZlIHRoaXMgcHJvcGVydHkgZnJvbSBT
UEwgRFQgaW4gLXUtYm9vdC5kdHNpIHVzaW5nCj4gPj4+Pj4gL2RlbGV0ZS1wcm9wZXJ0eS8gLgo+
ID4+Pj4+Cj4gPj4+Pj4gWy4uLl0KPiA+Pj4+Pgo+ID4+Pj4+PiAiV2UgbXVzdCBub3QgcHJvYmUg
dGhpbmdzIGFzIHdlIGdvLiBUaGVyZSBtaWdodCBiZSBvdGhlcgo+ID4+Pj4+PiBkZXBlbmRlbmNp
ZXMgbm90IHlldCBib3VuZC4gSXQgbWF5IGFsc28gdGFrZSBzb21lIHRpbWUuIFRoaXMgaXMgbm90
Cj4gPj4+Pj4+IGZvbGxvd2luZyBkcml2ZXIgbW9kZWwgZGVzaWduLCBzb3JyeS4KPiA+Pj4+Pj4K
PiA+Pj4+Pj4gU28gcGxlYXNlIHRoaW5rIG9mIGEgd2F5IHRvIGRvIHRoaXMgcHJvcGVybHkuIgo+
ID4+Pj4+Cj4gPj4+Pj4gV2hhdCBpcyB0aGlzIHF1b3RlIGFib3V0ID8gV2hlcmUgaXMgdGhpcyBm
cm9tID8KPiA+Pj4+Cj4gPj4+PiBXaGF0IGlzIHRoZSBwcm9ibGVtIHdpdGggVGVncmEgMyBhbmQg
dGhpcyBwYXRjaHNldCA/Cj4gPj4+Pgo+ID4+Pj4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiB0aGF0
IHNvIHRoaXMgcGF0Y2hzZXQgY2FuIG1vdmUgZm9yd2FyZCA/Cj4gPj4+Pgo+ID4+Pgo+ID4+PiB3
aXRoIHlvdXIgY2hhbmdlcwo+ID4+Pgo+ID4+PiBVLUJvb3QgMjAyNC4wNy0wMDY5Ni1nZTIxN2Uy
NzY5ZGI5LWRpcnR5IChBdWcgMjAgMjAyNCAtIDA5OjU1OjI5ICswMzAwKQo+ID4+Pgo+ID4+PiBT
b0M6IHRlZ3JhMTE0Cj4gPj4+IE1vZGVsOiBOVklESUEgVGVncmEgTm90ZSA3Cj4gPj4+IEJvYXJk
OiBOVklESUEgVGVncmFUYWIKPiA+Pj4gRFJBTTogIDEgR2lCCj4gPj4+IHRlZ3JhX2kyY19wcm9i
ZTogY2FsbGVkCj4gPj4+IGkyYzogY29udHJvbGxlciBidXMgMCBhdCA3MDAwZDAwMCwgc3BlZWQg
MDogdGVncmFfaTJjX3Byb2JlOiBleGl0Cj4gPj4+IGkyY19pbml0X2NvbnRyb2xsZXI6IHNwZWVk
PTQwMDAwMAo+ID4+PiBpMmNfaW5pdF9jb250cm9sbGVyOiBDTEtfRElWX1NURF9GQVNUX01PREUg
c2V0dGluZyA9IDI1Cj4gPj4+IGkyY194ZmVyOiAyIG1lc3NhZ2VzCj4gPj4+IGkyY194ZmVyOiBj
aGlwPTB4NTgsIGxlbj0weDEKPiA+Pj4gaTJjX3dyaXRlX2RhdGE6IGNoaXA9MHg1OCwgbGVuPTB4
MQo+ID4+PiB3cml0ZV9kYXRhOiAgMHgzNwo+ID4+PiBwa3QgaGVhZGVyIDEgc2VudCAoMHgxMDAx
MCkKPiA+Pj4gcGt0IGhlYWRlciAyIHNlbnQgKDB4MCkKPiA+Pj4gcGt0IGhlYWRlciAzIHNlbnQg
KDB4MTAwYjApCj4gPj4+IHBrdCBkYXRhIHNlbnQgKDB4MzcpCj4gPj4+IHRlZ3JhX2kyY193cml0
ZV9kYXRhOiBFcnJvciAoLTEpICEhIQo+ID4+PiBpMmNfd3JpdGVfZGF0YSgpOiByYz0tMQo+ID4+
PiBpMmNfd3JpdGU6IGVycm9yIHNlbmRpbmcKPiA+Pj4gcmVhZCBlcnJvciBmcm9tIGRldmljZTog
YmQyNmY4ZTAgcmVnaXN0ZXI6IDB4MzchCj4gPj4KPiA+PiBUaGlzIHNlZW1zIGxpa2UgdGhlIFBN
SUMgZHJpdmVyIChwYWxtYXM/KSBpcyB0cnlpbmcgdG8gcmVhZCByZWdpc3Rlcgo+ID4+IDB4Mzcg
UEdPT0QgYW5kIHRoZSBJMkMgdHJhbnNmZXIgZmFpbHMgLiBXaHkgZG9lcyB0aGUgSTJDIHRyYW5z
ZmVyIGZhaWwgPwo+ID4KPiA+IFlvdSAgYXJlIGFza2luZyBtZT8gQmVjYXVzZSB5b3VyIHBhdGNo
ZXMgYnJlYWsgc29tZSBpbXBvcnRhbnQgc2V0dXAgc2VxdWVuY2UuCj4gPiBQTUlDIG1vZGVsIGRv
ZXMgbm90IG1hdHRlciwgYWxsIGJlaGF2ZSBzYW1lIHdheS4KPgo+IFRoZXNlIHJlZ3VsYXRvciBw
YXRjaGVzIGRvIG5vdCBtb2RpZnkgYW55dGhpbmcgcmVsYXRlZCB0byBJMkMgYW5kIEkKPiBkb24n
dCBvYnNlcnZlIHRoaXMga2luZCBvZiBiZWhhdmlvciBvbiBpTVg4TSBvciBTVE0zMiBwbGF0Zm9y
bXMsIHNvIEkKPiBzdXNwZWN0IHRoaXMgaXMgc29tZXRoaW5nIHNwZWNpZmljIHRvIHRlZ3JhLgo+
Cj4gPj4gWW91IGRpZCBtZW50aW9uIHNvbWV0aGluZyByZWdhcmRpbmcgSTJDL1BNSUMgZHJpdmVy
IHByb2JlIHRpbWluZywgYnV0IGl0Cj4gPj4gc2VlbXMgdGhlIEkyQyBkcml2ZXIgYW5kIFBNSUMg
ZHJpdmVycyBwcm9iZSByb3VnaGx5IGFyb3VuZCB0aGUgc2FtZSB0aW1lCj4gPj4gaW4gYm90aCBw
YXNzIGFuZCBmYWlsIGNhc2VzID8KPiA+Cj4gPiBZZXMsIGhlcmUgSSBhZ3JlZSB0aGF0IHRoZXkg
Ym90aCBwcm9iZSBhbmQgcHJvYmUgcGFzc2VzLCBidXQgSSBhc3N1bWUKPiA+IHRpbWluZyBvZiBp
MmMgY2FsbCBpcyBjcml0aWNhbCBhbmQgdGhlcmUgbWF5IGJlIHNvbWUgZGVwZW5kZW5jeSB3aGlj
aAo+ID4gaXMgbm90IHJlYWR5Lgo+Cj4gTXkgZ3Vlc3Mgd291bGQgYmUgcGlubXV4IG9yIGNsb2Nr
LCBtYXliZSB0aGUgaTJjIGNvbnRyb2xsZXIgaXMgbWFya2VkIGFzCj4gYm9vdHBoLSogaW4gRFQg
YW5kIGl0cyBwaW5tdXgvY2xvY2sgaXMgbm90PyBNYXliZSB0aGUgaTJjIG9uIHRlZ3JhIHdvcmtz
Cj4gYnkgc2hlZXIgY29pbmNpZGVuY2UgcmlnaHQgbm93PyBDYW4geW91IGhhdmUgYSBsb29rPwoK
UG93ZXIgaTJjIGxpbmUgKG9uZSB0aGF0IGhvc3RzIFBNSUMpIGlzIGNvbmZpZ3VyZWQgZXh0cmVt
ZWx5IGVhcmx5IGluClNQTCBzaW5jZSBpdCBpcyBuZWVkZWQgZm9yIGNwdSBhbmQgY29yZSB2b2x0
YWdlIHNldHVwIHNvIGV2ZW4gaWYsIGFzCnlvdSBzYXksIHRlZ3JhIHdvcmtzIGJ5IHNoZWVyIGNv
aW5jaWRlbmNlLCBzcGVjaWZpY2FsbHkgdGhpcyBpMmMgbGluZQpzaG91bGQgd29yayBub24gdGhl
IGxlc3MsIHNpbmNlIGl0IGhhcyBhbGwgaXRzIHByZS1yZXF1aXNpdGVzIChjbG9jawphbmQgcGlu
bXV4KSBjb25maWd1cmVkIG9uIGVhcmx5IHN0YWdlLgoKQXMgSSBoYXZlIHRvbGQsIEkgd2FzIG5v
dCBhYmxlIHRvIGRldGVybWluZSBleGFjdCByZWFzb24gd2h5IHRoaXMKaGFwcGVucywgaXQgc2hv
dWxkIG5vdCBhbmQgeWV0IGl0IGRvZXMuIFRoaXMgaXMgd2h5IEkgaGF2ZSBhYmFuZG9uZWQKbXkg
YXR0ZW1wdCB0byBpbXBsZW1lbnQgc2FtZSBjaGFuZ2VzIHlvdSBhcmUgY3VycmVudGx5IHByb3Bv
c2luZy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJv
b3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vdWJvb3Qtc3RtMzIK
