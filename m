Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9145C89A2D8
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Apr 2024 18:47:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F6E6C6DD93;
	Fri,  5 Apr 2024 16:47:12 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A65D1C6C83C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 16:47:10 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-5f0a485dab9so244343a12.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Apr 2024 09:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712335629; x=1712940429;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BMoFFnC+TpaoltojlNDSFtVDhjHmB+MnxD/8vTc/QA=;
 b=QQWgpJ8LjIY1q9F3oGBHQpqtR6MxvIZw2OlB0AcavtnDR5bvIBsngcTlgzjsFtLHwz
 5U5pd+47j1Kfk/f0CoCCHaNsjqXDbZ57/FxTAS7kH8K7yCOkVrCqO+GGrfrcSuea+7N7
 BO+OLgbNj4g1a5i/BSkKRCxSibxQgW1mARweZaKAP8GDDZhoY21ePJvz9e9jQLGqf1Yw
 /Z+sNK0O+38wsF9w8l8+PIoKyaOQgzg6wMlsNvW7cKCGMvRtqfSQgin1fwMEW6Yex1S+
 QLLZRxYdB+wLbq70uo5aOiU5OkWRjzD7K1dmGidFQLSNRT30Bli4ONh7RDWuqchUIoYq
 kXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712335629; x=1712940429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BMoFFnC+TpaoltojlNDSFtVDhjHmB+MnxD/8vTc/QA=;
 b=r+xfAvkZTy1h0WRlxojThYxDd48KH5146SEsDeHRjYkB9R3rY3X8NjnajHJMKIBBnf
 CAmaE5I/nMUCkBruGYG+g/YEND5YkxT3oMUTvHW9pNqdncdxmkaWttd2bNCIUXXS9yeo
 X8gPpaGmsJdH3hu/LCCzFpPysUAV2eT7aJr7f0qnC5OPFbT+v6CVhvrWm4vvDKZIE5s1
 R+mXwKBJY7eHwZe+rKV7b04puFXRwDWKVdEgmMPFH7rOUPLxNc/W75GYWw0G7UijryNF
 VVI/v9XwC0fSKT5eIVmFxMADhcknHzroDrogVhaCFZXfsIgMmT0XjnTW2+DIZWlTsgt5
 VUlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiLSefbD2HxttyCb7lTmBnWX6sbJSyGMqssL8IQItSmgMHo3z6TO7kKjkZDDf4YN28HY/T5j5M6oWrVfIG2R7l0p1WY0IsEgo37n/Y4MSc/WOkz4iBnCKW
X-Gm-Message-State: AOJu0YyYNMWG3A00zwdsWsoeOuN8HKiQwG5OrN90qzMxi+4Kxbcj0eHf
 WSko+iwV5QnIJ6sbDQ5WTXHlXsCRNLhBbgUwfVdGIGK21XOLSLh7PxfsCgz8ReDxJ1dlL65TG2O
 ADFCOy4oiv8Tzhm6MtiPRESvby8o=
X-Google-Smtp-Source: AGHT+IEpw+tMVTbfOeRnqqMytdbNLZCPhvdug29tEIAw6YNBRwbfRoXwD8SOTYOmFto/GYX5PNH0Gwr5tukw5iw5EcU=
X-Received: by 2002:a17:90b:244:b0:2a2:666f:966d with SMTP id
 fz4-20020a17090b024400b002a2666f966dmr1911082pjb.1.1712335629093; Fri, 05 Apr
 2024 09:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240312211628.32842-1-marex@denx.de>
In-Reply-To: <20240312211628.32842-1-marex@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 5 Apr 2024 13:46:56 -0300
Message-ID: <CAOMZO5CBpkCiFRvO-1Ome5BqQhyyxJPDx_uCmUJPpyguB2R6KQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 Stefano Babic <sbabic@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] ARM: imx: stm32: Test whether ethernet
 node is enabled before reading MAC EEPROM on DHSOM
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgNjoxNuKAr1BNIE1hcmVrIFZhc3V0IDxtYXJleEBkZW54
LmRlPiB3cm90ZToKPgo+IENoZWNrIHdoZXRoZXIgdGhlIGV0aGVybmV0IGludGVyZmFjZSBpcyBl
bmFibGVkIGF0IGFsbCBiZWZvcmUgcmVhZGluZwo+IE1BQyBFRVBST00uIEFzIGEgY29zdCBzYXZp
bmcgbWVhc3VyZSwgaXQgY2FuIGhhcHBlbiB0aGF0IHRoZSBNQUMgRUVQUk9NCj4gaXMgbm90IHBv
cHVsYXRlZCBvbiBTb01zIHdoaWNoIGRvIG5vdCB1c2UgZXRoZXJuZXQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KCkFwcGxpZWQsIHRoYW5rcy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK
