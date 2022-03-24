Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C75234E699C
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Mar 2022 21:06:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51A31C60496;
	Thu, 24 Mar 2022 20:06:02 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69296C60468
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 20:06:01 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id d7so3140013vkd.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 13:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bL5TGW5Kh3H/RvLce3LmpMtk7ngDEQByz5bY2Z1HGPM=;
 b=CdD/V8u6fyfI7w8MuHLcuqL5p9Z4/3qc7r+qYW0lu8meiEnuej5+FucaxEVb6FuHmA
 OfsGlRnPpSlHA6x4Owm//tfuDQ3DZvim6DUvRAOUqPoITj72iEMmBv7SFoi0t3OvfUmw
 YcpzqusiWwU/22tCJcFBfkEFgs5Vtyn3lgtPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bL5TGW5Kh3H/RvLce3LmpMtk7ngDEQByz5bY2Z1HGPM=;
 b=jY1MyYspyghcGBQVF+tLL7Riukt1VTx0owlt2ASWExAiUX7mtOjK3W5mfNZsj6Q7Yp
 UR6UQtLIgkBkOX+db0I4reFLUpa7BdN92ffLeFPEJStDvOzZRjpb5hyLWxP377xPFNrw
 ixdTjluBXl3/LmCqAzwA4O3FRpyseU3hlxlPHmYPZsutTPvMVRLM62HfDc9BK1nssxGl
 DSCLegWR4EEBeWlr9ZENul8CXuwI/vw79GgYKbTWVlkGOiahu0va/3sVSx06XhtbZ2S+
 t+j9HYO+/LDyAW7a06w1OeObX6+aITsWugfOsoEY8rG20nxXR835tn68VFIINaCh+jje
 wpew==
X-Gm-Message-State: AOAM532BB1IELGqbpqaGInSRKLou3Vp44c3AtDjk928NN6T+aln/3yk9
 PcrXQ+Qxgu6Dn2jQocxVY9lxSa6awF00QlGFEn0CLA==
X-Google-Smtp-Source: ABdhPJxwK4vTG8mDsbFAynrlEqJYe0Ga7BXabK1uVetyDmhg1/iPMysLq8CFSQqtPypWzXAaKNTCzesVwPvAjUrQFCk=
X-Received: by 2002:a1f:2811:0:b0:33f:6c1e:7818 with SMTP id
 o17-20020a1f2811000000b0033f6c1e7818mr3343693vko.8.1648152360128; Thu, 24 Mar
 2022 13:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220123140415.3091482-1-sjg@chromium.org>
 <CAPnjgZ0UhAcCPmDeEPzrvYLXnPFC_sAZa6ssk=MwJkqDzHCMzQ@mail.gmail.com>
 <20220324195618.jf4zx3n5loc7hj6r@pali>
In-Reply-To: <20220324195618.jf4zx3n5loc7hj6r@pali>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 24 Mar 2022 14:05:49 -0600
Message-ID: <CAPnjgZ1b4fx6Xi6qeiiEprnNv+1+giYk+7cHfXi+YEpiyScXwg@mail.gmail.com>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Baruch Siach <baruch@tkos.co.il>, Aymen Sghaier <aymen.sghaier@nxp.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Samuel Egli <samuel.egli@siemens.com>,
 Peng Fan <peng.fan@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, U-Boot Mailing List <u-boot@lists.denx.de>,
 =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Hu <richard.hu@technexion.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, Marek Vasut <marex@denx.de>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Vanessa Maegima <vanessa.maegima@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Heiko Schocher <hs@denx.de>, Dario Binacchi <dariobin@libero.it>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Alison Wang <alison.wang@nxp.com>, Rick Chen <rick@andestech.com>,
 Matthias Brugger <mbrugger@suse.com>, Aswath Govindraju <a-govindraju@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Kory Maincent <kory.maincent@bootlin.com>,
 Anatolij Gustschin <agust@denx.de>, Joel Peshkin <joel.peshkin@broadcom.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>, Stephen Carlson <stcarlso@linux.microsoft.com>
Subject: Re: [Uboot-stm32] [PATCH 00/14] video: Drop old CFB code
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

SGkgUGFsaSwKCk9uIFRodSwgMjQgTWFyIDIwMjIgYXQgMTM6NTYsIFBhbGkgUm9ow6FyIDxwYWxp
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1cnNkYXkgMjQgTWFyY2ggMjAyMiAxMzo1NDoy
MiBTaW1vbiBHbGFzcyB3cm90ZToKPiA+IEhpIEFuYXRvbGlqLAo+ID4KPiA+IE9uIFN1biwgMjMg
SmFuIDIwMjIgYXQgMDc6MDQsIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3cm90ZToK
PiA+ID4KPiA+ID4gVGhlcmUgaXMgc3RpbGwgcXVpdGUgYSBiaXQgb2YgY3J1ZnQgaW4gdGhlIHZp
ZGVvIHN1YnN5c3RlbS4gTWFpbmx5IHRoaXMgaXMKPiA+ID4gdXNlcnMgb2YgdGhlIG5vdy1yZW1v
dmVkIENPTkZJR19WSURFTywgY2ZiX2NvbnNvbGUgYW5kIENPTkZJR19MQ0QuCj4gPiA+Cj4gPiA+
IFRoaXMgc2VyaWVzIHJlbW92ZXMgbW9zdCBvZiB0aGUgZmlyc3QgdHdvLiBUaGUgZXhjZXB0aW9u
IGlzIHZpZGVvbW9kZXMuYwo+ID4gPiBhbmQgaXRzIGhlYWRlciwgc2luY2UgdGhlc2UgYXJlIHVz
ZWQgYnkgc3VueGkuIEl0IGxvb2tzIGxpa2UgdGhlIGNvZGUKPiA+ID4gY291bGQgYmUgcmVtb3Zl
ZCwgYnV0IEkgZGlkIG5vdCBhdHRlbXB0IGl0Lgo+ID4gPgo+ID4gPiBUaGlzIGlzIGxlZnQgZm9y
IHRoZSBzdW54aSBtYWludGFpbmVyLgo+ID4gPgo+ID4gPiBUaGUgTENEIGNsZWFuLXVwIGNhbiBj
b21lIGxhdGVyLiBPbmNlIGRvbmUsIHdlIGNhbiByZW5hbWUgQ09ORklHX0RNX1ZJREVPCj4gPiA+
IHRvIENPTkZJR19WSURFTywgdGh1cyBjb21wbGV0aW5nIHRoZSBtaWdyYXRpb24uCj4gPiA+Cj4g
PiA+Cj4gPiA+IFNpbW9uIEdsYXNzICgxNCk6Cj4gPiA+ICAgdmlkZW86IERyb3AgY2ZnX2NvbnNv
bGUKPiA+ID4gICB2aWRlbzogbm9raWFfcng1MTogRHJvcCBvYnNvbGV0ZSB2aWRlbyBjb2RlCj4g
Li4uCj4gPgo+ID4gSXMgdGhlcmUgYW55IHdvcmQgb24gdGhpcyBzZXJpZXMsIHBsZWFzZT8KPgo+
IE5va2lhIGJvYXJkIGNvZGUgZG9lcyBub3QgdXNlIHRoaXMgY2ZiX2NvbnNvbGUgYW55bW9yZS4u
LiBPciBpdCBpcyBzdGlsbAo+IGFmZmVjdGVkPwoKSXQgc2hvdWxkIG5vdCBiZSBhZmZlY3RlZC4g
TWF5YmUgdGhpcyBwYXRjaCBjYW4gYmUgZHJvcHBlZD8KClJlZ2FyZHMsClNpbW9uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==
