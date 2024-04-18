Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 691908A98ED
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Apr 2024 13:48:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D86CC6C859;
	Thu, 18 Apr 2024 11:48:32 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75CB0C6C858
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 11:48:30 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-343d32aba7eso152985f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 04:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713440910; x=1714045710;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVRxNyZ0HZ4iSuQ1J+fUHEfJfTWOoqTLrz95VjTZqXQ=;
 b=cMfDyvUrk/dtW5eksb1T7GzJxlC7KYcFP4dFrWbhhDX1HGyxmd1sPYfjP6IE1ejCNu
 cEO4VIgUHSgWjBZbdU4AK4Hqi6oDbJ/nStdljCepAx4XMBPmr4nHn8KE3xr5ks8kkZHl
 XacUiEzP96HIm5tPjiNnmZqQ/gLKZmK5DDsuhF+FfBYvzKYIwrrpg8wdMoz+NjUljm73
 zXmLzoBwgfNjhq22Jdpy76dO3+m/guMscjjOkylw8gHwjo/cxjeSq5XECVp8wa6GjOSv
 aPSwKQt8v8RoUOcfovOgK+GwNPdZjMVhmAG5uRfLRyUBOPAvPOV3BFFZaaQ4jbjjyXsq
 GX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713440910; x=1714045710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVRxNyZ0HZ4iSuQ1J+fUHEfJfTWOoqTLrz95VjTZqXQ=;
 b=XBKgbnW2nm8lClX7gHDlcOAOHugsvq4MCaTVb75JgNgo/a96BJF/98iksBVo1dTbqi
 Lq0amlA+QoC0I0jcsA+npdZpFiKb50/w77hPbHxHJezVgC1Kqf41Iw1Y87KOyAt7KRZ/
 vgkEVH6YyVKCLWOHLzwntR+w3t/5hpKRYxBVjotVk0hAChG7kDmqBpFJlaReox1MPZMM
 L4vcpxQ4fxP4e4oI769aNFiiavf0c26LlCFKbjDVSog77fFo89LbdJCfUY4K2VDYgpoe
 rjwIffVTBh/UXp9eafbJeYmvAADPGCEhAuyreTDX3rN2VsZBMHsLGiOYuATRttVeEVo6
 le3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgwRQyCHKRFJQMBS2KWP804iSnAVDymSH8YqCVKZMSrpTdaZ6wzLjBoHYPfkLAO822i5A3zFODbok34wm3av1XRugJmEis5Zegs4J/hA9xSUkm9dlUE35v
X-Gm-Message-State: AOJu0YwfSnH9X8IQy3w9L0Vpv1AXJ3MdNXurlZT7UfFuKxTtk03gjziz
 ybD0+nQuE3GzShA0Pd9qrPs8maxk4AIfmAHMyKVJ3iBk4J3lt4ddMEqiULBSCkyePogyrKEZnAq
 AYkS6EsjdMNE0yCWuuI3ROiXBaumCYMiwrSuVNQ==
X-Google-Smtp-Source: AGHT+IGnqrDiNENt2RCbmiWzOHFfTcFohBJvcpB0F85/mGZMuyJBLRbJOO1mLIEtOPDHR3B5QNlfQz8uUGrcVDdwadI=
X-Received: by 2002:adf:a4d0:0:b0:34a:31fd:51c with SMTP id
 h16-20020adfa4d0000000b0034a31fd051cmr219201wrb.6.1713440909847; Thu, 18 Apr
 2024 04:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-6-patrice.chotard@foss.st.com>
In-Reply-To: <20240409150215.2497778-6-patrice.chotard@foss.st.com>
From: Igor Opaniuk <igor.opaniuk@gmail.com>
Date: Thu, 18 Apr 2024 13:48:18 +0200
Message-ID: <CAByghJZG403R9g0S+Q+aDgiCh74j_JzY+CXydv33mLCjSwFjLg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 05/25] configs: stm32mp1: Enable
	BUTTON_GPIO flag for stm32mp13_defconfig
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

T24gVHVlLCBBcHIgOSwgMjAyNCBhdCA1OjA14oCvUE0gUGF0cmljZSBDaG90YXJkCjxwYXRyaWNl
LmNob3RhcmRAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gRW5hYmxlIEJVVFRPTl9HUElPIGZsYWcg
Zm9yIFNUTTMyTVAxNS4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmlj
ZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IC0tLQo+Cj4gIGNvbmZpZ3Mvc3RtMzJtcDEzX2RlZmNv
bmZpZyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2NvbmZpZ3Mvc3RtMzJtcDEzX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3RtMzJtcDEzX2Rl
ZmNvbmZpZwo+IGluZGV4IGRiMDllNjMxMDBlLi5jYWFhYmYzOWVmMyAxMDA2NDQKPiAtLS0gYS9j
b25maWdzL3N0bTMybXAxM19kZWZjb25maWcKPiArKysgYi9jb25maWdzL3N0bTMybXAxM19kZWZj
b25maWcKPiBAQCAtNTIsNiArNTIsOCBAQCBDT05GSUdfU1lTX1JFRFVOREFORF9FTlZJUk9OTUVO
VD15Cj4gIENPTkZJR19TWVNfUkVMT0NfR0RfRU5WX0FERFI9eQo+ICBDT05GSUdfU1lTX01NQ19F
TlZfREVWPS0xCj4gIENPTkZJR19FTlZfTU1DX1VTRV9EVD15Cj4gK0NPTkZJR19CVVRUT049eQo+
ICtDT05GSUdfQlVUVE9OX0dQSU89eQo+ICBDT05GSUdfQ0xLX1NDTUk9eQo+ICBDT05GSUdfU0VU
X0RGVV9BTFRfSU5GTz15Cj4gIENPTkZJR19VU0JfRlVOQ1RJT05fRkFTVEJPT1Q9eQo+IC0tCj4g
Mi4yNS4xCj4KClJldmlld2VkLWJ5OiBJZ29yIE9wYW5pdWsgPGlnb3Iub3Bhbml1a0BnbWFpbC5j
b20+Ci0tIApCZXN0IHJlZ2FyZHMgLSBBdGVudGFtZW50ZSAtIE1laWxsZXVyZXMgc2FsdXRhdGlv
bnMKCklnb3IgT3Bhbml1awoKbWFpbHRvOiBpZ29yLm9wYW5pdWtAZ21haWwuY29tCnNreXBlOiBp
Z29yLm9wYW55dWsKaHR0cHM6Ly93d3cubGlua2VkaW4uY29tL2luL2lvcGFuaXVrCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==
