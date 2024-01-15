Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A59982DD97
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 17:28:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D01AFC6B457;
	Mon, 15 Jan 2024 16:28:21 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCA01C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 16:28:20 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-50edf4f478eso6519887e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 08:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foundries.io; s=google; t=1705336100; x=1705940900;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V01kjKK96ZMF1+fOIzrFK0neCpAdj9CUvAfWAZRohSk=;
 b=QSM0VAcTq8dOUKQHJiMu8BHaj6oEuvdaBoXDaBS5DeCyJlCHqfTl6puwNDux5sL4mT
 DYlAtdjlb5mu9+5QhBoWMvm7ST7BsiBsNifRAwAFx3Qo5MTqyYEST0iLZDLufx820RON
 TSsnPM/kv7cYSyEqluwibzGoIQCJdzG2G6oMTCqRh0TFrngUGavz/y2Y/oHNehcN9Pl6
 CDLDR8//d0JQQ74mcyJ0ljmP9gR3t1Xxki1paHE6Ti4Ef2NsJnhX1EXq5qUFbxJVDTPA
 O7iO+wi7PATweushy0C6ByR6RX75wjp6TXN+eVYGzcINoxoi0e1hzEJdA5HRiibTNwe/
 UO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705336100; x=1705940900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V01kjKK96ZMF1+fOIzrFK0neCpAdj9CUvAfWAZRohSk=;
 b=v/MEFbgqgKeqnrCOVTn93P8ZkEzmm6iLv4jb7Xy46Kfg2OOmAdmfkZ2Pg8Lo1Fk5MI
 Q4YOeJ+70FxGkvPmN1eJdyod+YYDT8LmPvux+7TMKuGuUnbm4fdvweVS4On7WJYUBxBW
 euAPl9t/WuHY2Vun5lwHmrZMao3yBsFsI52s/0xmxJu6rMwDbJeHtvi4rViC1zhCftZ1
 Pge2uI30EBXyMhCCut3+S7N8Qw2965h9ZvbGns4bqS4ShT5tyFV2TWH8YJjXUi84HEU1
 3IgyiQlPBu3Gr9aCsBMULAYts5cVq8UoBv4EXC2+CEq8WUqH0uqHbgqGceIxkV3mC0Q5
 3Plw==
X-Gm-Message-State: AOJu0YzHMOQFvZgWl8T5SNu4NXFNjZnSP532VuRoJ3WvvZGJoCxV/kNL
 WxRJI6GveFmbHbaOkongnX3i31kd37w/oQkEvQcRl6GYlfv8Xg==
X-Google-Smtp-Source: AGHT+IG/WCyndla7OkxfwIFAcL1PZ60F+aRfBxchDLfbHLivAHEVfnb0ZXby6NVEfN7r1sgb+YfZjz470uz4PNte7wk=
X-Received: by 2002:a05:6512:1247:b0:50e:7be0:3c38 with SMTP id
 fb7-20020a056512124700b0050e7be03c38mr3157290lfb.98.1705336100068; Mon, 15
 Jan 2024 08:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
 <20240115134642.4.I81fedd3d2ff9635b3738dd1ef349c936bc9b433d@changeid>
In-Reply-To: <20240115134642.4.I81fedd3d2ff9635b3738dd1ef349c936bc9b433d@changeid>
From: Igor Opaniuk <igor.opaniuk@foundries.io>
Date: Mon, 15 Jan 2024 17:28:08 +0100
Message-ID: <CAL6CDMFjDCUw=594CjYqK6Qs+M_k+KAkkN9QeYSSPECUr3z-0Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 04/12] stm32mp: bsec: add support of
	stm32mp25
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

T24gTW9uLCBKYW4gMTUsIDIwMjQgYXQgMTo0N+KAr1BNIFBhdHJpY2sgRGVsYXVuYXkKPHBhdHJp
Y2suZGVsYXVuYXlAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gQWRkIHN1cHBvcnQgb2YgQlNFQyBm
b3IgU1RNMzJNUDI1eCBmYW1pbHkgdG8gYWNjZXNzIE9UUC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBh
dHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gLS0tCj4KPiAg
YXJjaC9hcm0vbWFjaC1zdG0zMm1wL2JzZWMuYyAgICAgICAgICAgICAgIHwgNyArKysrKysrCj4g
IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaCB8IDMgKystCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2JzZWMuYyBiL2FyY2gvYXJtL21hY2gtc3RtMzJt
cC9ic2VjLmMKPiBpbmRleCA3MDVjOTk0ZDkzMDcuLjViODY5MDE3ZWMxYSAxMDA2NDQKPiAtLS0g
YS9hcmNoL2FybS9tYWNoLXN0bTMybXAvYnNlYy5jCj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0z
Mm1wL2JzZWMuYwo+IEBAIC03ODQsOSArNzg0LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Rt
MzJtcF9ic2VjX2RydmRhdGEgc3RtMzJtcDE1X2RhdGEgPSB7Cj4gICAgICAgICAuc2l6ZSA9IDk2
LAo+ICAgICAgICAgLnRhID0gZmFsc2UsCj4gIH07Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IHN0bTMybXBfYnNlY19kcnZkYXRhIHN0bTMybXAyNV9kYXRhID0gewo+ICsgICAgICAgLnNpemUg
PSAzNjgsIC8qIDM4NCBidXQgbm8gYWNjZXNzIHRvIEhXS0VZIGFuZCBTVE0zMlBSVktFWSAqLwo+
ICsgICAgICAgLnRhID0gdHJ1ZSwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdWRl
dmljZV9pZCBzdG0zMm1wX2JzZWNfaWRzW10gPSB7Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0g
InN0LHN0bTMybXAxMy1ic2VjIiwgLmRhdGEgPSAodWxvbmcpJnN0bTMybXAxM19kYXRhfSwKPiAg
ICAgICAgIHsgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDE1LWJzZWMiLCAuZGF0YSA9ICh1bG9u
Zykmc3RtMzJtcDE1X2RhdGF9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1w
MjUtYnNlYyIsIC5kYXRhID0gKHVsb25nKSZzdG0zMm1wMjVfZGF0YX0sCj4gICAgICAgICB7fQo+
ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gv
c3RtMzIuaCBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaAo+IGlu
ZGV4IDQ2ZDQ2OTg4MWIzMi4uNDVjOTI5YWE2MDVkIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL21h
Y2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaAo+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3Rt
MzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaAo+IEBAIC0xOTcsNyArMTk3LDggQEAgZW51bSBmb3Jj
ZWRfYm9vdF9tb2RlIHsKPiAgI2lmZGVmIENPTkZJR19TVE0zMk1QMjVYCj4gICNkZWZpbmUgQlNF
Q19PVFBfU0VSSUFMICAgICAgICA1Cj4gICNkZWZpbmUgQlNFQ19PVFBfUlBOICAgOQo+IC0jZGVm
aW5lIEJTRUNfT1RQX1BLRyAgIDI0Ngo+ICsjZGVmaW5lIEJTRUNfT1RQX1BLRyAgIDEyMgo+ICsj
ZGVmaW5lIEJTRUNfT1RQX01BQyAgIDI0Nwo+ICAjZW5kaWYKPgo+ICAjaWZuZGVmIF9fQVNTRU1C
TFlfXwo+IC0tCj4gMi4yNS4xCj4KClJldmlld2VkLWJ5OiBJZ29yIE9wYW5pdWsgPGlnb3Iub3Bh
bml1a0Bmb3VuZHJpZXMuaW8+CgotLSAKQmVzdCByZWdhcmRzIC0gRnJldW5kbGljaGUgR3LDvHNz
ZSAtIE1laWxsZXVyZXMgc2FsdXRhdGlvbnMKCklnb3IgT3Bhbml1awpFbWJlZGRlZCBTb2Z0d2Fy
ZSBFbmdpbmVlcgpUOiAgKzM4MCA5MzgzNjQwNjcKRTogaWdvci5vcGFuaXVrQGZvdW5kcmllcy5p
bwpXOiB3d3cuZm91bmRyaWVzLmlvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
