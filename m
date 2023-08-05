Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B97711F4
	for <lists+uboot-stm32@lfdr.de>; Sat,  5 Aug 2023 21:58:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13889C6B46A;
	Sat,  5 Aug 2023 19:58:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C08CC6B469
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 19:58:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8ceso28371625e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Aug 2023 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691265517; x=1691870317;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qTBsFZUAt64tE55iku5jMh+UeSSTVdzPi+QA3dIzEUY=;
 b=I4UKWYRX33D+dEx5is+sN69Yk5UuzUovm3/K/eF7gtyVbthTg6TkThZjRvZGTsApwv
 lnch2N8MEd2I+BIMfXvUGkYhp3P+CWTKcqhd0+EgXhkbJ6RmKXPhPF8HTuwGIPCzUqA/
 lOPxvAAvK2bnjyOJPi3V8i9MkSuxbUJUu/36azrhhfsMxXzlChHSSCkRmsO289bgn2Hf
 6r9BlVoDI3JTfF5xM8g4+EhwORHc1eRQTdbQPyTEKffXu2oil27RK3LcBOIBUMw9oIet
 Y2LB0cWY4zTEs6lsjbai1GsnRQNXOiRLng/ULHrjnQNMgoa6qpaF5tananb6qkWiFNIp
 XP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691265517; x=1691870317;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qTBsFZUAt64tE55iku5jMh+UeSSTVdzPi+QA3dIzEUY=;
 b=mEXHTqgO6belYFQ2F+EqaPH7ieWkuQWl2XGDXmZZkjAsqJAtIWYx4WSH2hxcqbZOWh
 JVA2v69noLvpcc97dnv29zLwWh5ASK/7TvuOB8N3lmcPFTLXCbrf8oVH4NBD4zJn5lqY
 RSmCZSI+Q+ZlBTuxdAKGuOYmukAqefjySX0yxQ5nYiUnW7RsDGkIQkCQ+ro8pWomc34m
 uypdf4jXlsG8la6IQz+h3+OfxJrKTQuzTdcUobhr+FWeH33unaVuA2q6PKNX2vJbEiMB
 qwkXU3+hAOCTRuMGGPXJrJeTSo7ixKcWTTaCelLVJCSG2w2CGH1BTNVzdW7gFrRMcebc
 odJA==
X-Gm-Message-State: AOJu0YyuhrmffC/UtZkCn00jPZW/WViz0xD/H8jk1UpLFk9RNM7PtROQ
 RwA4Svd/3ak5KyT7uanCThg=
X-Google-Smtp-Source: AGHT+IGVj74D7J0TgVmqVquRV6AZeP3y8rS9vl6Ey7c1+pja7CtRr5X9QZbzNtzOB8qctQIHl9hgNQ==
X-Received: by 2002:a05:600c:2283:b0:3fc:a8:dc3c with SMTP id
 3-20020a05600c228300b003fc00a8dc3cmr3493759wmf.37.1691265516692; 
 Sat, 05 Aug 2023 12:58:36 -0700 (PDT)
Received: from [127.0.0.1] ([194.44.62.230]) by smtp.gmail.com with ESMTPSA id
 g17-20020a7bc4d1000000b003fe26bf65e7sm5784334wmk.13.2023.08.05.12.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Aug 2023 12:58:36 -0700 (PDT)
Date: Sat, 05 Aug 2023 22:58:33 +0300
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonas Karlman <jonas@kwiboo.se>, Simon Glass <sjg@chromium.org>
User-Agent: K-9 Mail for Android
In-Reply-To: <09c6ff35-250a-18ff-667d-9ce62e24b18c@kwiboo.se>
References: <20230720123744.26854-1-clamor95@gmail.com>
 <20230720123744.26854-4-clamor95@gmail.com>
 <CAPnjgZ3jXmqtB=MTv7-SvEaKGyHHgO=zh5m8yPP=hbobh=B=pg@mail.gmail.com>
 <CAPVz0n2wxT_u0BDSdq5+VOkScdDJxAsBntr_p6ajawxiEszyzg@mail.gmail.com>
 <09c6ff35-250a-18ff-667d-9ce62e24b18c@kwiboo.se>
Message-ID: <4222D0DC-D1D9-4382-93A0-E09EFD807CCC@gmail.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 u-boot@dh-electronics.com, Matteo Lisi <matteo.lisi@engicam.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 3/7] power: regulator-uclass: perform
	regulator setup inside uclass
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

Cgo1INGB0LXRgNC/0L3RjyAyMDIzINGALiAxNTo0OTozMiBHTVQrMDM6MDAsIEpvbmFzIEthcmxt
YW4gPGpvbmFzQGt3aWJvby5zZT4g0L3QsNC/0LjRgdCw0LIoLdC70LApOgo+SGksCj4KPk9uIDIw
MjMtMDctMjEgMDc6MzQsIFN2eWF0b3NsYXYgUnloZWwgd3JvdGU6Cj4+INGH0YIsIDIwINC70LjQ
vy4gMjAyM+KAr9GALiDQviAyMjo0MyBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4g0L/Q
uNGI0LU6Cj4+Pgo+Pj4gSGkgU3Z5YXRvc2xhdiwKPj4+Cj4+PiBPbiBUaHUsIDIwIEp1bCAyMDIz
IGF0IDA2OjM4LCBTdnlhdG9zbGF2IFJ5aGVsIDxjbGFtb3I5NUBnbWFpbC5jb20+IHdyb3RlOgo+
Pj4+Cj4+Pj4gUmVndWxhdG9ycyBpbml0aWFsIHNldHVwIHdhcyBwcmV2aW91c2x5IGRlcGVuZGVu
dCBvbiBib2FyZCBjYWxsLgo+Pj4+IFRvIG1vdmUgZnJvbSB0aGlzIGJlaGF2aW91ciB3ZXJlIGlu
dHJvZHVjZWQgdHdvIHN0ZXBzLiBGaXJzdCBpcwo+Pj4+IHRoYXQgYWxsIGluZGl2aWR1YWwgcmVn
dWxhdG9ycyB3aWxsIGJlIHByb2JlZCBqdXN0IGFmdGVyIGJpbmRpbmcKPj4+Cj4+PiBXZSBtdXN0
IG5vdCBwcm9iZSBkZXZpY2VzIGF1dG9tYXRpY2FsbHkgd2hlbiBib3VuZC4gVGhlIGkyYyBpbnRl
cmZhY2UKPj4+IG1heSBub3QgYmUgYXZhaWxhYmxlLCBldGMuIERvIGEgcHJvYmUgYWZ0ZXJ3YXJk
cy4KPj4+Cj4+PiBQZXJoYXBzIEkgYW0gbWlzdW5kZXJzdGFuZGluZyB0aGlzLCBpd2MgcGxlYXNl
IHJld29yZCB0aGlzIGNvbW1pdCBtZXNzYWdlLgo+PiAKPj4gQWZ0ZXIgYm91bmQuIElmIHRoZSBy
ZWd1bGF0b3IgaXMgYSBzZWxmLXN1ZmZpY2llbnQgaTJjIGRldmljZSB0aGVuIGl0Cj4+IHdpbGwg
YmUgYm91bmQKPj4gYWZ0ZXIgaTJjIGlzIGF2YWlsYWJsZSBieSBjb2RlIGRlc2lnbiBzbyBpMmMg
aW50ZXJmYWNlIHNob3VsZCBiZQo+PiBhdmFpbGFibGUgYXQgdGhhdAo+PiBtb21lbnQuIEF0IGxl
YXN0IGxlZCBhbmQgZ3BpbyB1Y2xhc3NlcyBwZXJmb3JtIHRoaXMgZm9yIGluaXRpYWwgc2V0dXAK
Pj4gb2YgZGV2aWNlcy4KPj4gCj4+IFBsYXRmb3JtIHJlZ3VsYXRvcnMgKGFrYSBmaXhlZC9ncGlv
IHJlZ3VsYXRvcnMpIHdvcmsgcGVyZmVjdGx5IGZpbmUuIEkKPj4gaGF2ZSBubyBpMmMKPj4gcmVn
dWxhdG9ycyB0byB0ZXN0IGRlZXBseS4KPj4gCj4+IEFzIGZvciBub3cgb25seSBvbmUgdWNsYXNz
IGlzIG5vdCBjb21wYXRpYmxlIHdpdGggdGhpcyBzeXN0ZW0gLSBQTUlDIHdoaWNoIGhhcwo+PiBz
dHJvbmcgZGVwZW5kZW5jeSBiZXR3ZWVuIHJlZ3VsYXRvciBhbmQgbWFpbiBtZmQuIFRoaXMgaXMg
d2h5IHByb2JpbmcgYWZ0ZXIKPj4gYmluZCBmb3IgcG1pYyByZWd1bGF0b3JzIGlzIGRpc2FibGVk
IGFuZCBwbWljIHJlZ3VsYXRvcnMgYXJlIHByb2JlZCBvbiBwbWljIGNvcmUKPj4gcG9zdF9wcm9i
ZS4KPgo+VGhpcyBzb3VuZHMgbW9yZSBsaWtlIGEgcG9zc2libGUgYnVnIG9mIHNvbWUgZGVwZW5k
ZW5jeSBub3QgYmVpbmcKPnByb2JlZCBpbiBjb3JyZWN0IG9yZGVyIG9yIG5vdCBsZWF2aW5nIHRo
ZSBkZXZpY2UgaW4gYSByZWFkeSBzdGF0ZQo+YWZ0ZXIgcHJvYmUuCj4KPklmIHBtaWMgcmVndWxh
dG9ycyBhcmUgYmluZCBpbiBwbWljIGJpbmQgd2l0aCB0aGUgcG1pYyBhcyBwYXJlbnQsIHRoZW4K
PmF0IHJlZ3VsYXRvciBwcm9iZSB0aGUgZHJpdmVyIGNvcmUgZW5zdXJlIHRoYXQgcG1pYyBoYXMg
cHJvYmVkIGJlZm9yZQo+cmVndWxhdG9yIHVzZS4KPgo+VGhpcyB3b3JrcyBwZXJmZWN0IGZpbmUg
d2l0aCB0aGUgUks4eHggSTJDIFBNSUMgYW5kIGl0cyByZWd1bGF0b3JzLgo+V2ljaCBhIGNhbGwg
dG8gZGV2aWNlX2dldF9zdXBwbHlfcmVndWxhdG9yKGRldiwgInRlc3Qtc3VwcGx5IiwgJnJlZykK
PnByb2JlIGhhcHBlbnMgaW4gaTJjLCBwbWljIGFuZCByZWd1bGF0b3Igb3JkZXIuCj4KCkkgd2ls
bCBjaGVjayBhbmQgcmUtdGVzdCBkcml2ZXJzIEkgaGF2ZSBBU0FQLiAKCj4+IAo+Pj4+IHdoaWNo
IGVuc3VyZXMgdGhhdCByZWd1bGF0b3IgcGRhdGEgaXMgZmlsbGVkIGFuZCBzZWNvbmQgaXMgc2V0
dGluZwo+Pj4+IHVwIHJlZ3VsYXRvciBpbiBwb3N0IHByb2JlIHdoaWNoIGVuc2VyZXMgdGhhdCBj
b3JyZWN0IHJlZ3VsYXRvcgo+Pj4+IHN0YXRlIGFjY29yZGluZyB0byBwZGF0YSBpcyByZWFjaGVk
Lgo+Cj5JIHRoaW5rIHRoYXQgdGhlIGFwcHJvYWNoIGluIHRoaXMgcGF0Y2ggaXMgdHJ5aW5nIHRv
IGNoYW5nZSB0b28gbXVjaCBhbGwKPmF0IG9uY2UuCj4KPkhhdmUgbWFkZSBzb21lIGFkanVzdG1l
bnRzIHRoYXQgSSB0aGluayBzaG91bGQgaGVscCB3aXRoIHRyYW5zaXRpb24uCj4tIEFkZGVkIGEg
ZmxhZyB0byBwcm90ZWN0IHJlZ3VsYXRvcl9hdXRvc2V0IGZyb20gYmVpbmcgY2FsbGVkIG1vcmUg
dGhlbgo+ICBvbmNlIGZvciBlYWNoIHJlZ3VsYXRvciwgaW4gYSBzZXBhcmF0ZSBwYXRjaC4KCkl0
IGlzIG5vdCBhIGdvb2QgZGVjaXNpb24gaW4gdGhlIGxvbmcgcnVuIGFuZCB5b3Ugc2hvdWxkIGtl
ZXAgaW4gbWluZCB0aGF0IHRoZXJlIGlzIG5vdGhpbmcgbW9yZSBjb25zdGFudCB0aGFuIGEgdGVt
cG9yYXJ5IHNvbHV0aW9uLgoKPi0gQ2hhbmdlZCB0byBvbmx5IHByb2JlLWFmdGVyLWJpbmQgb24g
cmVndWxhdG9ycyBtYXJrZWQgYXMKPiAgYWx3YXlzLW9uL2Jvb3Qtb24uCj4KPkFuZCBpdCB3b3Jr
cyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+Cj5zdGF0aWMgaW50IHJlZ3VsYXRvcl9wb3N0X2JpbmQo
c3RydWN0IHVkZXZpY2UgKmRldikKPnsKPglbLi4uXQo+Cj4JaWYgKHVjX3BkYXRhLT5hbHdheXNf
b24gfHwgdWNfcGRhdGEtPmJvb3Rfb24pCj4JCWRldl9vcl9mbGFncyhkZXYsIERNX0ZMQUdfUFJP
QkVfQUZURVJfQklORCk7Cj59Cj4KPnN0YXRpYyBpbnQgcmVndWxhdG9yX3Bvc3RfcHJvYmUoc3Ry
dWN0IHVkZXZpY2UgKmRldikKPnsKPglyZXQgPSByZWd1bGF0b3JfYXV0b3NldChkZXYpOwo+fQo+
Cj5XaXRoIHRoYXQgYW55IGFsd2F5cy1vbi9ib290LW9uIHJlZ3VsYXRvciB3b3VsZCBhdXRvbWF0
aWNhbGx5IHByb2JlIGFuZAo+YXV0b3NldCBhZnRlciBiaW5kLCByZW1haW5pbmcgd291bGQgb25s
eSBwcm9iZSBhbmQgYXV0b3NldCBpZiB0aGV5IGFyZQo+dXNlZC4KCnVjX3BkYXRhIGlzIGZpbGxl
ZCBpbiBwcmVfcHJvYmUsIHdoaWxlIHlvdSBhcmUgcnVuaW5nIGNoZWNrIGluIHBvc3RfYmluZC4K
Cj5UaGlzIGFwcHJvYWNoIHNob3VsZCBhbHNvIHByZXZlbnQgaGF2aW5nIHRvIGNoYW5nZSBleGlz
dGluZyBjb2RlIHRoYXQKPm1heSBjYWxsIGF1dG9zZXQsIGFuZCBjbGVhbnVwIGNhbiBiZSBkb25l
IGluIGZvbGxvdy11cCBwYXRjaGVzL3Nlcmllcy4KPgo+UHJvYmUtYWZ0ZXItYmluZCBhbmQgY2Fs
bCB0byBhdXRvc2V0IGNvdWxkIGFsc28gYmUgcHJvdGVjdGVkIHdpdGggYSBuZXcKPktjb25maWcg
dG8gaGVscCB3aXRoIHRyYW5zaXRpb24uCj4KPlNlZSBmb2xsb3dpbmcgZm9yIGEgd29ya2luZyBl
eGFtcGxlIHVzaW5nIGEgbmV3IGRyaXZlciB0aGF0IGRlcGVuZHMKPm9uIHRoYXQgcmVndWxhdG9y
cyBoYXZlIGJlZW4gYXV0b3NldCBwcmlvciB0byByZWd1bGF0b3JfZ2V0X3ZhbHVlLgo+aHR0cHM6
Ly9naXRodWIuY29tL0t3aWJvby91LWJvb3Qtcm9ja2NoaXAvY29tcGFyZS9tYXN0ZXIuLi5yazM1
NjgtaW8tZG9tYWluCj4KPk9yIHRoZSB0d28gY29tbWl0cyBzZXBhcmF0ZToKPgo+cG93ZXI6IHJl
Z3VsYXRvcjogT25seSBydW4gYXV0b3NldCBvbmNlIGZvciBlYWNoIHJlZ3VsYXRvcgo+aHR0cHM6
Ly9naXRodWIuY29tL0t3aWJvby91LWJvb3Qtcm9ja2NoaXAvY29tbWl0LzA1ZGI0ZGJjYjhmOTA4
YjQxN2VkNWNhZThhN2EzMjVjODIxMTJkNzUKPgo+cG93ZXI6IHJlZ3VsYXRvcjogUGVyZm9ybSBy
ZWd1bGF0b3Igc2V0dXAgaW5zaWRlIHVjbGFzcwo+aHR0cHM6Ly9naXRodWIuY29tL0t3aWJvby91
LWJvb3Qtcm9ja2NoaXAvY29tbWl0LzQ4OWJkNWQyYzFhMmEzMzgyNGVhYzRmMmQ1NDM5OWVmNWRm
ZjRmZGYKPgo+UmVnYXJkcywKPkpvbmFzCj4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFN2eWF0
b3NsYXYgUnloZWwgPGNsYW1vcjk1QGdtYWlsLmNvbT4KPj4+PiAtLS0KPj4+PiAgZHJpdmVycy9w
b3dlci9yZWd1bGF0b3IvcmVndWxhdG9yLXVjbGFzcy5jIHwgMjEyICsrKysrKy0tLS0tLS0tLS0t
LS0tLQo+Pj4+ICBpbmNsdWRlL3Bvd2VyL3JlZ3VsYXRvci5oICAgICAgICAgICAgICAgICAgfCAx
MTkgLS0tLS0tLS0tLS0tCj4+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwg
MjY5IGRlbGV0aW9ucygtKQo+Pj4KPj4+IFJlZ2FyZHMsCj4+PiBTSW1vbgo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
