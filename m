Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F09973D4A07
	for <lists+uboot-stm32@lfdr.de>; Sat, 24 Jul 2021 23:12:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1A59C597AC;
	Sat, 24 Jul 2021 21:12:00 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1F61C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jul 2021 21:11:57 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b7so6225179wri.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jul 2021 14:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ZnbhsnIWQdJ1aKuFtqZdp9MBjhAIpeI7ZYJkL2yHFeQ=;
 b=eyPdk9sfchMIt9igbnjODOSdoVzhPWri4SAeTZwjFMTbmN+q/Uehbmfw87XVrrV0Zi
 0QWETxMNrxHqJdrqkgC862156ziMgyJB5hh0qjRVj8K9ep6IY8iFbvKPxmO0n7BJMjVT
 Dku4kPLAjLHqKoDL2I9U3Wna9Esnl8LEEfu3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ZnbhsnIWQdJ1aKuFtqZdp9MBjhAIpeI7ZYJkL2yHFeQ=;
 b=j3N/YI6foA9nuLEIs6oQvIfEEjvdQfAkbaNt2nmGdQOkjodopUQSNNHHKXq7aMVNIY
 8WGzBM2r/IFB4XJ7Rh0ZFUHx0r69atNVniOg6K6l3ANRr6YLG9lVHH4+MEnDjKdQLNH4
 qQGWyoRrpMuE3mAvPt8INZXdBd6ZJ5WouuKfAcbzf1LhMuk5dnSjr9mcWuW0Pi1WZbw8
 AMU6+cURxWwCmGc+BLFgTmwqa1R+Nf0609S8ilcUeLOjpjIa/TJyoSzJnBcfIbkHP2kg
 PjdDIxePhKEfc3FpeDnXF44e+JLV5BOc3qkx9Mh49pmP08olNvcAPKBJ4wX6DIQQq2kj
 3jOA==
X-Gm-Message-State: AOAM532DFYqX40JB8PZIi1vVpM1sSJSHVGHRy7wt+G/EQXB2DHYzKvu2
 1iiVqhDDOT4MI00xAElzQAauYyvt0YzqDtzH8LJ+tw==
X-Google-Smtp-Source: ABdhPJw6u8BTqyxsO09vZxAvpMXkMLc/8/hm/x6vit5zTnqyJDRBgm9Rqn4pecxUllGRxsDp9c0OMqGL0FAZfih1PUM=
X-Received: by 2002:adf:e409:: with SMTP id g9mr12077183wrm.66.1627161116470; 
 Sat, 24 Jul 2021 14:11:56 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Jul 2021 14:11:55 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ1L_tQ6Qp9oZCmNidd4bYNAsO8aKzzDyywtRdG8RhMa8A@mail.gmail.com>
References: <CAPnjgZ1L_tQ6Qp9oZCmNidd4bYNAsO8aKzzDyywtRdG8RhMa8A@mail.gmail.com>
 <20210722165101.v2.1.I6630d4cc18870d3e830587ffbcb61898dc045cb6@changeid>
Date: Sat, 24 Jul 2021 14:11:55 -0700
X-Google-Sender-Auth: 8X3JkSsNCyK4bT68OAISkvGEuSM
Message-ID: <CAPnjgZ3ac2_vnD7DwsoQ-ttA5QZLCrG4mgOeGM_Jm_fg0Qfkaw@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] patman: add warning for invalid tag
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

T24gVGh1LCAyMiBKdWwgMjAyMSBhdCAwODo1MSwgUGF0cmljayBEZWxhdW5heQo8cGF0cmljay5k
ZWxhdW5heUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4KPiBBZGQgYSBlcnJvciBpbiBwYXRtYW4gdG9v
bCB3aGVuIHRoZSBjb21taXQgbWVzc2FnZSBjb250ZW50cyBhbiBpbnZhbGlkCj4gdGFnICJTZXJp
ZS0uKiIgaW5zdGVhZCBvZiAiU2VyaWVzLS4qIi4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sg
RGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4KPiAtLS0KPiBJIGNyZWF0
ZSB0aGlzIHBhdGNoIHRvIGF2b2lkIG15IGZyZXF1ZW50IG1pc3Rha2U6Cj4gdXNpbmcgIlNlcmll
LSIgdGFnIGluc3RlYWQgb2YgIlNlcmllcy0iIGFzIGl0IGlzIGRvbmUgaW4gWzFdLgo+Cj4gUkVf
SU5WX1RBRyBjYW4gYmUgZXh0ZW5kZWQgdG8gb3RoZXIgZnJlcXVlbnQgZXJyb3JzLgo+Cj4gQW55
ICJTZXJpZS0iIHRhZyBpcyByZWZ1c2VkIHdpdGggdGhlIHBhdGNoLCBmb3IgZXhhbXBsZToKPgo+
IFZhbHVlRXJyb3I6IExpbmUgMjg6IEludmFsaWQgdGFnID0KPiAgICAnU2VyaWUtY2M6IE1hcmVr
IEJlaMO6biA8bWFyZWsuYmVodW5AbmljLmN6PicKPgo+IFsxXSBodHRwOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC91Ym9vdC9wYXRjaC8yMDIxMDcyMDIwMzM1My4xLkk1NTBiOTVmNmQx
MmQ1OWFlZWY1Yjc0NGQ4MzdkYmIzNjAwMzdkMzllQGNoYW5nZWlkLwo+Cj4KPiBDaGFuZ2VzIGlu
IHYyOgo+IC0gYWRkIHBhdG1hbiB0ZXN0IHRlc3RJbnZhbGlkVGFnCj4KPiAgdG9vbHMvcGF0bWFu
L2Z1bmNfdGVzdC5weSAgIHwgMTEgKysrKysrKysrKysKPiAgdG9vbHMvcGF0bWFuL3BhdGNoc3Ry
ZWFtLnB5IHwgIDkgKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KQo+CgpSZXZpZXdlZC1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+CgpBcHBsaWVk
IHRvIHUtYm9vdC1kbSwgdGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
