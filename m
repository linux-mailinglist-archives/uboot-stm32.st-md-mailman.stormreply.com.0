Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A38391A2A0
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Jun 2024 11:26:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DBD5C71282;
	Thu, 27 Jun 2024 09:26:39 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67456C71280
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 09:26:32 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-48f48ab80e3so1793376137.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 02:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719480391; x=1720085191;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1DkUuazq8vxodeJDVSZK5XFQNO6SO002ptc7qNZXWg=;
 b=hr8pbYrKK/onC2y68+XTskIKxNbEU/sB5DcCEUPcQ1EnOm6IanjeC+eMA/AQP3vdfl
 tjBjoywdUOKNXl6r8u+7wNPSbpy2n8EQv3oSnQyPnN8MvvAw9/OIss+N7xlC73Fb1gJM
 ZSLkn5YjOLIk5NqUzurLH2IurDnAX6rYYjKZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719480391; x=1720085191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k1DkUuazq8vxodeJDVSZK5XFQNO6SO002ptc7qNZXWg=;
 b=WmDkfsVJ7hQAgbJ5q0zSuDCi86lAmOuOrQn7rkqQhiVAIr8wMVuX40eC6StUpZ4+yh
 PGrjdtIHWEyHZGOkuoEYjpKtiMDshL2eFQcTV/b0YG4IWtE7TYrgcDQYJXmEeMeKzVvn
 2zFbQUHEur49EiYiblV58Ndfc1htJxg1mxoc3oVI8caylQIKm1ZhN6LsZ9dDPI4dWR/2
 9TPPo8oWmqy95B2YUviFBc7EojmXJNOXMSPxnEMtHAEDUkIASjHq88rLjucTPoat41M8
 sLl74IlxFZWb/Wi15QhMkTPPW7Z11EQ/kACs4RkAlSNSUyMKjJiuw5VmO5/M/i63TsOS
 0cFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6XEFS12MZwTG7Jv0ZwndM9BkUhBTU+rf9YK5hd6Od0n7rQkQ2ntPcwW3PJw5sBYHmnL55mAUOiFGpfLyMDBTpR8Wavo5NCauzzzkui8qGVZnVODd2wwwL
X-Gm-Message-State: AOJu0YySqJIt0VNJ3YHoIj3CrLfXDLetxNr9zdc7z9btzqdtdblnmmIc
 8KjpQ9J0jU7Qwy0axClKqBO+D/iiO7AmgBjnzGOV1kN/anDG4vFmw34Nj+LSBrjQ5Lku/W0aEBf
 mx/AZc5M9cCppk68titlfZXgI33zqY8WVJki/
X-Google-Smtp-Source: AGHT+IGJPN/7H22wI3Bm2sb0VeGg2njtL+j6FUyvh7/84X70PrkULQ9to/cjtl3hwGoYZRcQ9dxIHuJ4KznQPPmiAvg=
X-Received: by 2002:a05:6102:303c:b0:48f:408e:45ef with SMTP id
 ada2fe7eead31-48f5295781emr12817318137.7.1719480391172; Thu, 27 Jun 2024
 02:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
 <b84e8b10-8698-41f2-9648-0b3f5c399b02@linaro.org>
 <96AEFD59-B8D3-4298-8867-E94D474E16BE@gmail.com>
In-Reply-To: <96AEFD59-B8D3-4298-8867-E94D474E16BE@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 27 Jun 2024 10:26:20 +0100
Message-ID: <CAFLszTgvEkunWE8apORsK0+PU7wjrWCVCR0F1qij=yo8nDLUNg@mail.gmail.com>
To: Svyatoslav <clamor95@gmail.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot-qcom@groups.io, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 u-boot-amlogic@groups.io, Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Kostya Porotchkin <kostap@marvell.com>,
 Ben Wolsieffer <benwolsieffer@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jonas Karlman <jonas@kwiboo.se>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, u-boot@dh-electronics.com,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Sumit Garg <sumit.garg@linaro.org>
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

SGkgU3Z5YXRvc2xhdiwKCk9uIFRodSwgMjcgSnVuIDIwMjQgYXQgMTA6MDksIFN2eWF0b3NsYXYg
PGNsYW1vcjk1QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gMjcg0YfQtdGA0LLQvdGPIDIwMjTi
gK/RgC4gMTE6NDg6NDYgR01UKzAzOjAwLCBDYWxlYiBDb25ub2xseSA8Y2FsZWIuY29ubm9sbHlA
bGluYXJvLm9yZz4g0L3QsNC/0LjRgdCw0LIoLdC70LApOgo+ID4KPiA+Cj4gPk9uIDI3LzA2LzIw
MjQgMTA6MzcsIFNpbW9uIEdsYXNzIHdyb3RlOgo+ID4+IEhpIE1hcmVrLAo+ID4+Cj4gPj4gT24g
VGh1LCAyNyBKdW4gMjAyNCBhdCAwMDo1NywgTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+IHdy
b3RlOgo+ID4+Pgo+ID4+PiBJbiBjYXNlIGEgcmVndWxhdG9yIERUIG5vZGUgY29udGFpbnMgcmVn
dWxhdG9yLWFsd2F5cy1vbiBvciByZWd1bGF0b3ItYm9vdC1vbgo+ID4+PiBwcm9wZXJ0eSwgbWFr
ZSBzdXJlIHRoZSByZWd1bGF0b3IgZ2V0cyBjb3JyZWN0bHkgY29uZmlndXJlZCBieSBVLUJvb3Qg
b24gc3RhcnQKPiA+Pj4gdXAuIFVuY29uZGl0aW9uYWxseSBwcm9iZSBzdWNoIHJlZ3VsYXRvciBk
cml2ZXJzLiBUaGlzIGlzIGEgcHJlcGFyYXRvcnkgcGF0Y2gKPiA+Pj4gZm9yIGludHJvZHVjdGlv
biBvZiAucmVndWxhdG9yX3Bvc3RfcHJvYmUoKSB3aGljaCB3b3VsZCB0cmlnZ2VyIHRoZSByZWd1
bGF0b3IKPiA+Pj4gY29uZmlndXJhdGlvbi4KPiA+Pj4KPiA+Pj4gUGFyc2luZyBvZiByZWd1bGF0
b3ItYWx3YXlzLW9uIGFuZCByZWd1bGF0b3ItYm9vdC1vbiBEVCBwcm9wZXJ0eSBoYXMgYmVlbgo+
ID4+PiBtb3ZlZCB0byByZWd1bGF0b3JfcG9zdF9iaW5kKCkgYXMgdGhlIGluZm9ybWF0aW9uIGlz
IHJlcXVpcmVkIGVhcmx5LCB0aGUKPiA+Pj4gcmVzdCBvZiB0aGUgRFQgcGFyc2luZyBoYXMgYmVl
biBrZXB0IGluIHJlZ3VsYXRvcl9wcmVfcHJvYmUoKSB0byBhdm9pZAo+ID4+PiBzbG93aW5nIGRv
d24gdGhlIGJvb3QgcHJvY2Vzcy4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFz
dXQgPG1hcmV4QGRlbnguZGU+Cj4gPj4+IC0tLQo+ID4+PiBDYzogQmVuIFdvbHNpZWZmZXIgPGJl
bndvbHNpZWZmZXJAZ21haWwuY29tPgo+ID4+PiBDYzogQ2FsZWIgQ29ubm9sbHkgPGNhbGViLmNv
bm5vbGx5QGxpbmFyby5vcmc+Cj4gPj4+IENjOiBDaHJpcyBNb3JnYW4gPG1hY3JvbW9yZ2FuQGhv
dG1haWwuY29tPgo+ID4+PiBDYzogRHJhZ2FuIFNpbWljIDxkc2ltaWNAbWFuamFyby5vcmc+Cj4g
Pj4+IENjOiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QGNvbGxhYm9yYS5jb20+Cj4gPj4+
IENjOiBGcmFuY2VzY28gRG9sY2luaSA8ZnJhbmNlc2NvLmRvbGNpbmlAdG9yYWRleC5jb20+Cj4g
Pj4+IENjOiBIZWlucmljaCBTY2h1Y2hhcmR0IDx4eXByb24uZ2xwa0BnbXguZGU+Cj4gPj4+IENj
OiBKYWVob29uIENodW5nIDxqaDgwLmNodW5nQHNhbXN1bmcuY29tPgo+ID4+PiBDYzogSmFnYW4g
VGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPj4+IENjOiBKb25hcyBLYXJsbWFu
IDxqb25hc0Brd2lib28uc2U+Cj4gPj4+IENjOiBLZXZlciBZYW5nIDxrZXZlci55YW5nQHJvY2st
Y2hpcHMuY29tPgo+ID4+PiBDYzogS29zdHlhIFBvcm90Y2hraW4gPGtvc3RhcEBtYXJ2ZWxsLmNv
bT4KPiA+Pj4gQ2M6IE1hdHRlbyBMaXNpIDxtYXR0ZW8ubGlzaUBlbmdpY2FtLmNvbT4KPiA+Pj4g
Q2M6IE1hdHRpanMgS29ycGVyc2hvZWsgPG1rb3JwZXJzaG9la0BiYXlsaWJyZS5jb20+Cj4gPj4+
IENjOiBNYXggS3J1bW1lbmFjaGVyIDxtYXgua3J1bW1lbmFjaGVyQHRvcmFkZXguY29tPgo+ID4+
PiBDYzogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4gPj4+IENj
OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiA+Pj4gQ2M6
IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gPj4+IENj
OiBQaGlsaXBwIFRvbXNpY2ggPHBoaWxpcHAudG9tc2ljaEB2cnVsbC5ldT4KPiA+Pj4gQ2M6IFF1
ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBjaGVycnkuZGU+Cj4gPj4+IENjOiBTYW0gRGF5
IDxtZUBzYW1jZGF5LmNvbT4KPiA+Pj4gQ2M6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3Jn
Pgo+ID4+PiBDYzogU3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPgo+ID4+PiBDYzog
U3Z5YXRvc2xhdiBSeWhlbCA8Y2xhbW9yOTVAZ21haWwuY29tPgo+ID4+PiBDYzogVGhpZXJyeSBS
ZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiA+Pj4gQ2M6IFRvbSBSaW5pIDx0cmluaUBrb25z
dWxrby5jb20+Cj4gPj4+IENjOiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtA
ZXBhbS5jb20+Cj4gPj4+IENjOiB1LWJvb3QtYW1sb2dpY0Bncm91cHMuaW8KPiA+Pj4gQ2M6IHUt
Ym9vdC1xY29tQGdyb3Vwcy5pbwo+ID4+PiBDYzogdS1ib290QGRoLWVsZWN0cm9uaWNzLmNvbQo+
ID4+PiBDYzogdS1ib290QGxpc3RzLmRlbnguZGUKPiA+Pj4gQ2M6IHVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiA+Pj4gLS0tCj4gPj4+ICAgZHJpdmVycy9wb3dlci9y
ZWd1bGF0b3IvcmVndWxhdG9yLXVjbGFzcy5jIHwgMjIgKysrKysrKysrKysrKysrLS0tLS0tLQo+
ID4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+
ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wb3dlci9yZWd1bGF0b3IvcmVndWxhdG9y
LXVjbGFzcy5jIGIvZHJpdmVycy9wb3dlci9yZWd1bGF0b3IvcmVndWxhdG9yLXVjbGFzcy5jCj4g
Pj4+IGluZGV4IDY2ZmQ1MzFkYTA0Li5jY2M0ZWYzM2Q4MyAxMDA2NDQKPiA+Pj4gLS0tIGEvZHJp
dmVycy9wb3dlci9yZWd1bGF0b3IvcmVndWxhdG9yLXVjbGFzcy5jCj4gPj4+ICsrKyBiL2RyaXZl
cnMvcG93ZXIvcmVndWxhdG9yL3JlZ3VsYXRvci11Y2xhc3MuYwo+ID4+PiBAQCAtNDMzLDYgKzQz
Myw4IEBAIHN0YXRpYyBpbnQgcmVndWxhdG9yX3Bvc3RfYmluZChzdHJ1Y3QgdWRldmljZSAqZGV2
KQo+ID4+PiAgICAgICAgICBjb25zdCBjaGFyICpwcm9wZXJ0eSA9ICJyZWd1bGF0b3ItbmFtZSI7
Cj4gPj4+Cj4gPj4+ICAgICAgICAgIHVjX3BkYXRhID0gZGV2X2dldF91Y2xhc3NfcGxhdChkZXYp
Owo+ID4+PiArICAgICAgIHVjX3BkYXRhLT5hbHdheXNfb24gPSBkZXZfcmVhZF9ib29sKGRldiwg
InJlZ3VsYXRvci1hbHdheXMtb24iKTsKPiA+Pj4gKyAgICAgICB1Y19wZGF0YS0+Ym9vdF9vbiA9
IGRldl9yZWFkX2Jvb2woZGV2LCAicmVndWxhdG9yLWJvb3Qtb24iKTsKPiA+Pj4KPiA+Pj4gICAg
ICAgICAgLyogUmVndWxhdG9yJ3MgbWFuZGF0b3J5IGNvbnN0cmFpbnQgKi8KPiA+Pj4gICAgICAg
ICAgdWNfcGRhdGEtPm5hbWUgPSBkZXZfcmVhZF9zdHJpbmcoZGV2LCBwcm9wZXJ0eSk7Cj4gPj4+
IEBAIC00NDQsMTMgKzQ0NiwyMSBAQCBzdGF0aWMgaW50IHJlZ3VsYXRvcl9wb3N0X2JpbmQoc3Ry
dWN0IHVkZXZpY2UgKmRldikKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOwo+ID4+PiAgICAgICAgICB9Cj4gPj4+Cj4gPj4+IC0gICAgICAgaWYgKHJlZ3VsYXRv
cl9uYW1lX2lzX3VuaXF1ZShkZXYsIHVjX3BkYXRhLT5uYW1lKSkKPiA+Pj4gLSAgICAgICAgICAg
ICAgIHJldHVybiAwOwo+ID4+PiArICAgICAgIGlmICghcmVndWxhdG9yX25hbWVfaXNfdW5pcXVl
KGRldiwgdWNfcGRhdGEtPm5hbWUpKSB7Cj4gPj4+ICsgICAgICAgICAgICAgICBkZWJ1ZygiJyVz
JyBvZiBkZXY6ICclcycsIGhhcyBub251bmlxdWUgdmFsdWU6ICclc1xuIiwKPiA+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIHByb3BlcnR5LCBkZXYtPm5hbWUsIHVjX3BkYXRhLT5uYW1lKTsKPiA+
Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4+PiArICAgICAgIH0KPiA+Pj4K
PiA+Pj4gLSAgICAgICBkZWJ1ZygiJyVzJyBvZiBkZXY6ICclcycsIGhhcyBub251bmlxdWUgdmFs
dWU6ICclc1xuIiwKPiA+Pj4gLSAgICAgICAgICAgICBwcm9wZXJ0eSwgZGV2LT5uYW1lLCB1Y19w
ZGF0YS0+bmFtZSk7Cj4gPj4+ICsgICAgICAgLyoKPiA+Pj4gKyAgICAgICAgKiBJbiBjYXNlIHRo
ZSByZWd1bGF0b3IgaGFzIHJlZ3VsYXRvci1hbHdheXMtb24gb3IKPiA+Pj4gKyAgICAgICAgKiBy
ZWd1bGF0b3ItYm9vdC1vbiBEVCBwcm9wZXJ0eSwgdHJpZ2dlciBwcm9iZSgpIHRvCj4gPj4+ICsg
ICAgICAgICogY29uZmlndXJlIGl0cyBkZWZhdWx0IHN0YXRlIGR1cmluZyBzdGFydHVwLgo+ID4+
PiArICAgICAgICAqLwo+ID4+PiArICAgICAgIGlmICh1Y19wZGF0YS0+YWx3YXlzX29uICYmIHVj
X3BkYXRhLT5ib290X29uKQo+ID4+PiArICAgICAgICAgICAgICAgZGV2X29yX2ZsYWdzKGRldiwg
RE1fRkxBR19QUk9CRV9BRlRFUl9CSU5EKTsKPiA+Pj4KPiA+Pj4gLSAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiA+Pj4gKyAgICAgICByZXR1cm4gMDsKPiA+Pj4gICB9Cj4gPj4+Cj4gPj4+ICAgc3Rh
dGljIGludCByZWd1bGF0b3JfcHJlX3Byb2JlKHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4gPj4+IEBA
IC00NzMsOCArNDgzLDYgQEAgc3RhdGljIGludCByZWd1bGF0b3JfcHJlX3Byb2JlKHN0cnVjdCB1
ZGV2aWNlICpkZXYpCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtRU5PREFUQSk7Cj4gPj4+ICAgICAgICAgIHVjX3BkYXRhLT5tYXhfdUEgPSBk
ZXZfcmVhZF91MzJfZGVmYXVsdChkZXYsICJyZWd1bGF0b3ItbWF4LW1pY3JvYW1wIiwKPiA+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1FTk9EQVRB
KTsKPiA+Pj4gLSAgICAgICB1Y19wZGF0YS0+YWx3YXlzX29uID0gZGV2X3JlYWRfYm9vbChkZXYs
ICJyZWd1bGF0b3ItYWx3YXlzLW9uIik7Cj4gPj4+IC0gICAgICAgdWNfcGRhdGEtPmJvb3Rfb24g
PSBkZXZfcmVhZF9ib29sKGRldiwgInJlZ3VsYXRvci1ib290LW9uIik7Cj4gPj4+ICAgICAgICAg
IHVjX3BkYXRhLT5yYW1wX2RlbGF5ID0gZGV2X3JlYWRfdTMyX2RlZmF1bHQoZGV2LCAicmVndWxh
dG9yLXJhbXAtZGVsYXkiLAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDApOwo+ID4+PiAgICAgICAgICB1Y19wZGF0YS0+Zm9yY2Vfb2Zm
ID0gZGV2X3JlYWRfYm9vbChkZXYsICJyZWd1bGF0b3ItZm9yY2UtYm9vdC1vZmYiKTsKPiA+Pj4g
LS0KPiA+Pj4gMi40My4wCj4gPj4+Cj4gPj4KPiA+PiBUaGlzIGlzIHJlYWRpbmcgYSBsb3Qgb2Yg
RFQgc3R1ZmYgdmVyeSBlYXJseSwgd2hpY2ggbWF5IGJlIHNsb3cuIEl0IGlzCj4gPj4gYWxzbyBy
ZWFkaW5nIGZyb20gdGhlIERUIGluIHRoZSBiaW5kKCkgc3RlcCB3aGljaCB3ZSBzb21ldGltZXMg
aGF2ZSB0bwo+ID4+IGRvLCBidXQgdHJ5IHRvIGF2b2lkLgo+ID4KPiA+Q291bGQgd2Ugc2V0IHVw
IHRoZSBsaXZldHJlZSBwcmUtYmluZD8gV2hhdCBhYm91dCBNTVU/IE9uIGFybXY4IGF0IGxlYXN0
IHRoaXMgd291bGQgaGF2ZSBhIGh1Z2UgaW1wYWN0IG9uIHBlcmZvcm1hbmNlLiBJJ3ZlIGRvbmUg
c29tZSBtZWFzdXJlbWVudHMgYW5kIHRoZXJlIGlzIGF0IGxlYXN0IDEgb3JkZXIgb2YgbWFnbml0
dWRlIGRpZmZlcmVuY2UgYmV0d2VlbiBwYXJzaW5nIEZEVCB3aXRoIG5vIGNhY2hlcyB2cyBwYXJz
aW5nIGxpdmV0cmVlIHdpdGgsIGl0J3MgaHVnZS4KPiA+Pgo+ID4+IEFsc28gdGhpcyBzZWVtcyB0
byBoYXBwZW4gaW4gU1BMIGFuZCBhZ2FpbiBwcmUtcmVsb2MgYW5kIGFnYWluIGluCj4gPj4gVS1C
b290IHBvc3QtcmVsb2M/Cj4KPiBOb3Qgc28gbG9uZyBhZ28gSSBwcm9wb3NlZCBhIHNpbWlsYXIg
cGF0Y2hzZXQgd2l0aCB0aGUgc2FtZSBnb2FsCj4gYW5kIEkgaGF2ZSBkaXNjb3ZlcmVkIG1hc3Np
dmUgaXNzdWVzIHdpdGggU1BMIGFuZCByZWxvY2F0aW9uCj4gaW50ZXJmZXJpbmcgd2l0aCBkcml2
ZXIgbG9hZGluZy4KPgo+IFRoZSBpc3N1ZSB3aGljaCBJIGhhdmUgcGVyc29uYWxseSBlbmNvdW50
ZXJlZCB3YXMgaTJjIGRyaXZlciBmYWlsdXJlCj4gZHVlIHRvIGRvdWJsZSBwcm9iaW5nLiBUaGlz
IGJlaGF2aW9yIHdhcyB0cmlnZ2VyZWQgYnkKPiBhbHdheXMtb24vYm9vdC1vbiByZWd1bGF0b3Jz
IHByb3ZpZGVkIGJ5IHBtaWMgd2hpY2ggaW4gbW9zdAo+IGNhc2VzIGlzIGFuIGkyYyBkZXZpY2Uu
Cj4KPiBBdCB0aGF0IHRpbWUgZXZlcnlvbmUganVzdCBpZ25vcmVkIG1lLCBzbyBpZGsgaWYgdGVn
cmEgaTJjIGlzIHRoZSBvbmx5Cj4gZHJpdmVyIHdoaWNoIGhhcyB0aGlzIHJlc3BvbnNlIG9yIHRo
ZXJlIGFyZSBtb3JlLCBidXQgYmUgYXdhcmUgdGhhdAo+IHRoaXMgcGF0Y2ggc2V0IG1heSBjYXVz
ZSBjYXNjYWRlIGZhaWx1cmUgb24gbWFueSBkZXZpY2VzLgoKSSdtIG5vdCBzdXJlIGlmIEkgcmVt
ZW1iZXIgdGhpcywgYnV0IEkgY2FuIGNlcnRhaW5seSBzZWUgc29tZSBwcm9ibGVtcwp3aXRoIGl0
LiBEaWQgd2UgaGF2ZSBkcml2ZXJzIHRoYXQgcHJvYmVkIGluIHRoZSBiaW5kKCkgZnVuY3Rpb24s
CnBlcmhhcHM/Cgo+Cj4gQmVzdCByZWdhcmRzLAo+IFN2eWF0b3NsYXYgUi4KPgo+ID4+Cj4gPj4g
U2hvdWxkIHdlIGhhdmUgYSBzdGVwIGluIHRoZSBpbml0IHNlcXVlbmNlIHdoZXJlIHdlIHNldCB1
cCB0aGUKPiA+PiByZWd1bGF0b3JzLCBieSBjYWxsaW5nIHJlZ3VsYXRvcnNfZW5hYmxlX2Jvb3Rf
b24oKSA/Cj4gPj4KPiA+PiBSZWdhcmRzLAo+ID4+IFNpbW9uCj4gPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
