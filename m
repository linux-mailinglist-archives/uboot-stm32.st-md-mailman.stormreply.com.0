Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE47B46F7
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 07:48:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDC14C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 05:48:38 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FD5EC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 05:48:36 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id o205so1760879oib.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2019 22:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J0BYO2Pt2Ua9VZ2cebZf1yqWO+cFeAx3jXwbXI8WxpI=;
 b=A3p06fepM8jN5pakEhhJRh4YqSwfrnrWUJbSAc5hU0yUJlhv0pDPWmiKprpBfdE1kM
 yNR3hiBU+8rS5IsYE7J0WCsK6gTebKQtyGyhCN+LpddkTGqmAAQeJHWsVLg1cHBpL2q3
 egreGB5Ok6R++rCCvurtTe1fFCy2CeRYRVvkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J0BYO2Pt2Ua9VZ2cebZf1yqWO+cFeAx3jXwbXI8WxpI=;
 b=SENAAh8k3/ThCmbSe/ysHDaMebs310/Md9VFQS0APhaFMGKTaNThEqWEu/XAGeXsGN
 /S40XLkTcSXoFIBd/t6Mn0nOX42s0Sh1NgRZEIV72n9n/UrBsUEFn9SEDa8ghl9LEEWi
 vK5RrtHPZIQu4IpIAXCQJqeXRyytAIEqIK18K16/coVphVUDxt9FEeqAIsn0Ym0p5hWd
 LykkD0e2sY/mlRYS679GPjVWwLnrjStW8Iaz6n8SyzbbCHAO06OSuuU9LtMswkZm2Qvm
 MpeOxF9F7CtDPEkWW0bDAiI/ncOOlMRUVLJv8qEfu7RDVpcwBhioHGAhj/ZXnXKedMfR
 iJvQ==
X-Gm-Message-State: APjAAAUasVM2uUTH12T8n3ANHQsxIaYeKQMnkIVyYK70cdW5JUCCNDwI
 hGiNSJ8EWjz2EXiLumLpDIdAf879t7CB7/SuAmx8sg==
X-Google-Smtp-Source: APXvYqw7CWKDFsvZHu0dnfw1mjQCMCYCe0J03h4ff/1TMg3ntK+il0aUGCeFxE+c6vZHnV3RnnStQuzsccwrqsSsCjg=
X-Received: by 2002:aca:5a04:: with SMTP id o4mr2414145oib.97.1568699314796;
 Mon, 16 Sep 2019 22:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
 <1568368083-11075-2-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1568368083-11075-2-git-send-email-yannick.fertre@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 16 Sep 2019 22:48:11 -0700
Message-ID: <CAPnjgZ2RV1yb0HtcZbS_grCjA8M4AeB07Fto+8e+=hCpN_owGg@mail.gmail.com>
To: =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>
Cc: Albert Aribaud <albert.u.boot@aribaud.net>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Anatolij Gustschin <agust@denx.de>, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v4 01/15] video: bmp: check resolutions of
	panel/bitmap
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

T24gRnJpLCAxMyBTZXAgMjAxOSBhdCAwMjo0OCwgWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZl
cnRyZUBzdC5jb20+IHdyb3RlOgo+Cj4gSWYgdGhlIHNpemUgb2YgdGhlIGJpdG1hcCBpcyBiaWdn
ZXIgdGhhbiB0aGUgc2l6ZSBvZgo+IHRoZSBwYW5lbCB0aGVuIGVycm9ycyBhcHBlYXIgd2hlbiBj
YWxjdWxhdGluZyBheGlzIGFsaWdubWVudAo+IGFuZCB0aGUgY29weSBvZiBiaXRtYXAgaXMgZG9u
ZSBvdXRzaWRlIG9mIGZyYW1lYnVmZmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0
csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vdmlkZW9f
Ym1wLmMgfCAxNCArKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKQoKUmV2aWV3ZWQtYnk6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
