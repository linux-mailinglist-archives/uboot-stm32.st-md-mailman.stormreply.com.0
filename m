Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2714B3D321D
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Jul 2021 05:07:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC383C597BE;
	Fri, 23 Jul 2021 03:07:58 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80983C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 03:07:55 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 k12-20020a05600c1c8cb02901f259f3a250so773478wms.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 20:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4iqfLIaU10rRdsuTl9SwdKb4voQ4eHY320H1mETxdT4=;
 b=ggiH7v33SuY48Y3e3ietm49WXm9P6CifCdVswTjbEszo/OtrYqwjwjtvb0iTRbeb6w
 vD6otcVmXqMtC+FMXqcGtmtU0w+0OMh7+aTbDkNTZEUKpq55aKDLSqskXuzMryacsMDY
 zNMR4AM8Qc+0k9k69mWiPBwQpA27RmdUUVRFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4iqfLIaU10rRdsuTl9SwdKb4voQ4eHY320H1mETxdT4=;
 b=OPd8EsINpEG3mqtR7AkIECAucf1eF674lyM5VwXgbxPQJ7Udzqvjvy6gUAbCzVclnk
 +0qkEEoLYQiz21uX8yK9RKtHo2hGPbKKK/CfnsxPBGfzGPADuO+r4ofY+3smbuRHQFo9
 NoOserBmQ6c7JPZaNY8+stxl+UXqSKuu5t0ts9erX5DYtQ6ZGdJox5KnuYegFIDKg4zE
 N6+pASMJitqAbukbtJMiz+qj2c89z7XkMUzJoOo1DN67pm+aZ6uTmtcMhPNelxOWSgeV
 Kyz7xbhqUrmUoUDMbvwNqqWx5M1hEwHmuB80aD0dq5ELoXLI1iUX5f65IYlCxxaeEGLu
 xvjw==
X-Gm-Message-State: AOAM5315iSIqwgZ6qSvA3r3ru+XVRyqgHoISs9oei+ZbwvCYFCmcnkRJ
 OellSZbrwXEtretIsoa5hPy770cqpP8D4djzgrv5Qw==
X-Google-Smtp-Source: ABdhPJyyY+MJZW8ICvBgXtLaA7YQCNEQrrVq6cF8A6PTsLjTFT5sFetYoorW8zwge2M0Gjl1MHDd/6tKllk1vTrtjuI=
X-Received: by 2002:a7b:c949:: with SMTP id i9mr2338517wml.168.1627009674810; 
 Thu, 22 Jul 2021 20:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210722165101.v2.1.I6630d4cc18870d3e830587ffbcb61898dc045cb6@changeid>
In-Reply-To: <20210722165101.v2.1.I6630d4cc18870d3e830587ffbcb61898dc045cb6@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 22 Jul 2021 21:07:41 -0600
Message-ID: <CAPnjgZ1L_tQ6Qp9oZCmNidd4bYNAsO8aKzzDyywtRdG8RhMa8A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
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
KQo+CgpSZXZpZXdlZC1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==
