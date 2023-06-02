Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 869EF71FF51
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Jun 2023 12:29:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 343CDC6B443;
	Fri,  2 Jun 2023 10:29:29 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F207C6B442
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 10:29:28 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-75afa109e60so179205285a.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jun 2023 03:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685701767; x=1688293767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cb0XrtugQYkaE0Rw63ku0QdQRYrXbO4KaZPcCYHc7i4=;
 b=akfUL0GbIFOHX0yaLI52UBDm1QaDLCQIDOaj76JjL3GpXiW0gWioQodpyFGKYl9NRc
 xFwzhGnoeyBqA0BAnyqk130o5N4iI4bEvMnUlHXukLXPm2ISTfbLwiGE+7f3K8qFilMF
 skiZFyYSsZOLGEumpxIQFiGRrsZfZVeBrxzJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685701767; x=1688293767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cb0XrtugQYkaE0Rw63ku0QdQRYrXbO4KaZPcCYHc7i4=;
 b=b5nFrXKtzsFe6D9hFPgif7jy55zQG6+7pJct5I0o3PGkcJxUgakmAjTa80VErLPCKD
 dw2NvY9K4IzMeJj0GsFfvLtX8fNiRsnwl7iZ+qbLF1gvi/vQ4C6dh2ziaH0sUWBSTb2S
 fYhUPmKJeCc2ADiwv2NxN0hHwPQg7m4pxIKEs4rK202Fw7VpwR8knq4KdwfADJSTcpg4
 brTw5sVkixG3ItdaleKYslZ7Z6YjXVRDPzeym1JyUH1tiD4mGlHmVzR8DHc0fFZNU8J0
 F/MkLwc/oHxz5AUokjb1NIyZ+0iVOUx+xpBEjepE68fKbivODlO5QKJesnRiUG4owqCd
 fBHA==
X-Gm-Message-State: AC+VfDwonyvTidl/0QlruLBq+s029Pr9Drjb8Q2KX95I95elRpyhMRkW
 pnpq2Cta15NHdBp8YNh9re7iLvh28coeGumoYWbUYQ==
X-Google-Smtp-Source: ACHHUZ7pbE2340KgbmorkVIgxXGig/hY1wpJZMHQL56TGkAhTtnyNDycCIqk4vJU24DTd8TWbu2gEE4sqXGzsfayl5E=
X-Received: by 2002:a05:620a:8a8b:b0:75b:23a1:8e3f with SMTP id
 qu11-20020a05620a8a8b00b0075b23a18e3fmr9119470qkn.16.1685701767039; Fri, 02
 Jun 2023 03:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230601170602.2845768-1-dario.binacchi@amarulasolutions.com>
 <20230601171137.GY3755309@bill-the-cat>
In-Reply-To: <20230601171137.GY3755309@bill-the-cat>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 2 Jun 2023 12:29:16 +0200
Message-ID: <CABGWkvpXQkPgU1kaTZOG9uqQJ5tvbF2=W=O1j+yHBxJozAKGXA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: fix display pinmux for
	stm32f746-disco
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

T24gVGh1LCBKdW4gMSwgMjAyMyBhdCA3OjEx4oCvUE0gVG9tIFJpbmkgPHRyaW5pQGtvbnN1bGtv
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biAwMSwgMjAyMyBhdCAwNzowNjowMlBNICswMjAw
LCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiA+IEFzIHJlcG9ydGVkIGJ5IHRoZSBkYXRhc2hlZXQg
KERvY0lEMDI3NTkwIFJldiA0KSBmb3IgUEcxMjoKPiA+IC0gQUY5ICAtPiBMQ0RfQjQKPiA+IC0g
QUYxNCAtPiBMQ0RfQjEKPiA+Cj4gPiBTbyByZXBsYWNlIEFGMTQgd2l0aCBBRjkgZm9yIFBHMTIg
aW4gdGhlIGR0cy4KPiA+Cj4gPiBGaXhlczogZmU2M2QzY2ZiNzdlZiAoIkFSTTogZHRzOiBzdG0z
MjogU3luYyBEVCB3aXRoIHY0LjIwIGtlcm5lbCBmb3Igc3RtMzJmNyIpCj4gPiBTaWduZWQtb2Zm
LWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+
Cj4gPgo+ID4gLS0tCj4gPgo+ID4gIGFyY2gvYXJtL2R0cy9zdG0zMmY3NDYtZGlzY28tdS1ib290
LmR0c2kgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMmY3NDYtZGlzY28t
dS1ib290LmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJmNzQ2LWRpc2NvLXUtYm9vdC5kdHNpCj4g
PiBpbmRleCAxOWI1NDUxZGI0NDEuLjUyMmNmZmIxYWM5ZiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
YXJtL2R0cy9zdG0zMmY3NDYtZGlzY28tdS1ib290LmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtL2R0
cy9zdG0zMmY3NDYtZGlzY28tdS1ib290LmR0c2kKPiA+IEBAIC0xNjksNyArMTY5LDcgQEAKPiA+
ICAgICAgIGx0ZGNfcGluczogbHRkY0AwIHsKPiA+ICAgICAgICAgICAgICAgcGlucyB7Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnRScsIDQsIEFGMTQp
PiwgLyogQjAgKi8KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8U1RNMzJfUElO
TVVYKCdHJywxMiwgQUYxNCk+LCAvKiBCNCAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDxTVE0zMl9QSU5NVVgoJ0cnLDEyLCBBRjkpPiwgIC8qIEI0ICovCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPFNUTTMyX1BJTk1VWCgnSScsIDksIEFGMTQpPiwgLyog
VlNZTkMgKi8KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8U1RNMzJfUElOTVVY
KCdJJywxMCwgQUYxNCk+LCAvKiBIU1lOQyAqLwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDxTVE0zMl9QSU5NVVgoJ0knLDE0LCBBRjE0KT4sIC8qIENMSyAqLwo+Cj4gV2h5IGlz
IHRoaXMgd2hvbGUgc3RhbnphIGluIGEgLXUtYm9vdC5kdHNpIGZpbGUgYW5kIG5vdCBhbiB1cHN0
cmVhbQo+IGZpbGU/CgpJIGp1c3Qgc3VibWl0dGVkIGEgc2VyaWVzIHRvIHRoZSBsaW51eCBrZXJu
ZWwgdG8gYWRkIHN1cHBvcnQgZm9yCmRpc3BsYXkgb24gc3RtMzJmNzQ2LWRpc2NvLgpodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjMwNjAxMTcwMzIwLjI4NDUyMTgt
MS1kYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbS9ULwoKVGhhbmtzIGFuZCByZWdh
cmRzLApEYXJpbwo+Cj4gLS0KPiBUb20KCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVt
YmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5j
b20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9u
cyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4g
KzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNv
bHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vdWJvb3Qtc3RtMzIK
