Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF2E3D01E8
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 20:50:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E93FC597BD;
	Tue, 20 Jul 2021 18:50:41 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24937CFAC5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 18:50:40 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id f17so27100678wrt.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4LhNWbnw5ZNAEiy/9Uv13AI+4UDHWpT/3/QI+RbdMGI=;
 b=kSzloBK0pY8AlbdifhJPYl7wusbURXF+FlGEgkwVTQWicIOwN2xbI6RmFhidPbF56O
 sNo9XtAUphYEDyKZeil0XLeES5gK+Leu6VOw0XExSJyCNhFlWrHnpgdoW7++SHE8pTxy
 R/ibHXorOjgXQ/PzpFQO1Jzkn8WOZyTw80e34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4LhNWbnw5ZNAEiy/9Uv13AI+4UDHWpT/3/QI+RbdMGI=;
 b=fyZsfB2iU9puGul5tnKXGjexxe+pHdnCKrz6CCeJoHokQt8NuDy3Bor7gFCX+PIlt6
 HO5Cc3FMeVX5a/8Yo7VfYOfwI2WxfvOUHmgEI/qx+6OiR/08qgFk25YJ5FiBGtU3vmtu
 d5NsP2b5WTvXBZuM63/9ViX3rRlImBAEEYilG8SPF0mtB2LZ0sK47cJ3SXl0USD/6oLz
 zNN90eTLYD0LUnaUmp60w3JiXQ2D6/ozOZJj4eXMlgigLc1ZdNiRSuCsgJ8PfI7S9c/N
 8HQluGJrtZFTf2blSNLuDaLWUd+wTXolKtzINgUHMP5/sN+pdnzFeWElf4mc4Zbv3Dqw
 mXUg==
X-Gm-Message-State: AOAM531vVNL4rtX2TUXM3WaHZoaqeHwDZHNKoBQ5EJohrhpYze4smhTk
 TZgQ/mvn2wky15knhCXZaQm+8H12vlZkS+Xas52Oxw==
X-Google-Smtp-Source: ABdhPJxpyau+ksvBfAP276xLloj5Elo8KKUvEyfoUcJsPGizPF0KgVkYnvNceVvGE9CI1Awxz5N7KrCYLKaPd84I0aA=
X-Received: by 2002:a5d:4522:: with SMTP id j2mr36882481wra.43.1626807039358; 
 Tue, 20 Jul 2021 11:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210720203353.1.I550b95f6d12d59aeef5b744d837dbb360037d39e@changeid>
In-Reply-To: <20210720203353.1.I550b95f6d12d59aeef5b744d837dbb360037d39e@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 20 Jul 2021 12:50:28 -0600
Message-ID: <CAPnjgZ1Pm5EnOqGw29LpEM9bKEefR2rO5-dT0++F6OSsUQyvsQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [Uboot-stm32] [PATCH] build: remove the variable NM in
	gen_ll_addressable_symbols.sh
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

SGkgUGF0cmljaywKCk9uIFR1ZSwgMjAgSnVsIDIwMjEgYXQgMTI6MzQsIFBhdHJpY2sgRGVsYXVu
YXkKPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gV2l0aCBMVE8gYWN0
aXZhdGVkLCB0aGUgYnVpbGRtYW4gdG9vbHMgZmFpbGVkIHdpdGggYW4gZXJyb3Igb24gbXkKPiBj
b25maWd1cmF0aW9uIChVYnVudHUgMjAuMDQsIHN0bTMybXAxNV90cnVzdGVkX2RlZmNvbmZpZykg
d2l0aCB0aGUgZXJyb3I6Cj4KPiAuLi9hcm0tbGludXgtZ251ZWFiaS9iaW4vbm06Cj4gICAgICAg
ICBzY3JpcHRzL2dlbl9sbF9hZGRyZXNzYWJsZV9zeW1ib2xzLnNoOiBmaWxlIGZvcm1hdCBub3Qg
cmVjb2duaXplZAo+Cj4gSXQgc2VlbXMgdGhlIHNoZWxsIHZhcmlhYmxlIGluaXRpYWxpemF0aW9u
IE5NPSQoTk0pIGlzIG5vdCBjb3JyZWN0bHkKPiBpbnRlcnByZXRlZCB3aGVuIHNoZWxsIGlzIHN0
YXJ0ZWQgaW4gdGhlIE1ha2VmaWxlLCBidXQgSSBoYXZlIG5vdCB0aGlzCj4gaXNzdWUgd2hlbiBJ
IGNvbXBpbGUgdGhlIHNhbWUgdGFyZ2V0IHdpdGhvdXQgYnVpbGRtYW4uCj4KPiBJIGRvbid0IGZv
dW5kIHRoZSByb290IHJlYXNvbiBvZiB0aGUgcHJvYmxlbSBidXQgSSBzb2x2ZSBpdCBieQo+IHBy
b3ZpZGluZyAkKE5NKSBhcyBzY3JpcHQgcGFyYW1ldGVyIGluc3RlYWQgdXNpbmcgYSBzaGVsbCB2
YXJpYWJsZS4KPgo+IFRoZSBjb21tYW5kIGV4ZWN1dGVkIGlzIGlkZW50aWNhbDoKPgo+IGNtZF9r
ZWVwLXN5bXMtbHRvLmMgOj0gTk09YXJtLW5vbmUtbGludXgtZ251ZWFiaWhmLWdjYy1ubSBcCj4g
dS1ib290L3NjcmlwdHMvZ2VuX2xsX2FkZHJlc3NhYmxlX3N5bWJvbHMuc2ggYXJjaC9hcm0vY3B1
L2J1aWx0LWluLm8gXAo+IC4uLi4gbmV0L2J1aWx0LWluLm8gPmtlZXAtc3ltcy1sdG8uYwo+Cj4g
Y21kX2tlZXAtc3ltcy1sdG8uYyA6PSB1LWJvb3Qvc2NyaXB0cy9nZW5fbGxfYWRkcmVzc2FibGVf
c3ltYm9scy5zaCBcCj4gYXJtLW5vbmUtbGludXgtZ251ZWFiaWhmLWdjYy1ubSBhcmNoL2FybS9j
cHUvYnVpbHQtaW4ubyBcCj4gLi4uIG5ldC9idWlsdC1pbi5vID4ga2VlcC1zeW1zLWx0by5jCj4K
PiBTZXJpZS1jYzogTWFyZWsgQmVow7puIDxtYXJlay5iZWh1bkBuaWMuY3o+Cj4gU2VyaWUtY2M6
IHNqZwoKU2VyaWVzLWNjCgo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJp
Y2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gLS0tCj4KPiAgTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgc2NyaXB0cy9NYWtlZmlsZS5zcGwgICAgICAgICAg
ICAgICAgICB8IDIgKy0KPiAgc2NyaXB0cy9nZW5fbGxfYWRkcmVzc2FibGVfc3ltYm9scy5zaCB8
IDUgKysrKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpSZXZpZXdlZC1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==
