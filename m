Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE7365D2BB
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Jan 2023 13:32:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C488C6905D;
	Wed,  4 Jan 2023 12:32:54 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E801AC6905B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jan 2023 12:32:52 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id ay40so25464658wmb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Jan 2023 04:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qsd9Joc7eUwkOZ4AJBpZWHOmVFjfsgrK79de1YKC/tQ=;
 b=ueTBMsdtGCkDjJ8wcA7V0zoyD4AD8ond/7gwQ3Ez/WuT7W98ezNwdhKT/UeDvb7exb
 XF4G0Am4G6w0gR0ARvhGrAEKdx2dm70JwkJ2J4JU10TVn2orlUDbZpEhm2+k0ZCo3vnU
 KFzqwHnn+Nd6os0Ty9hMST2gl+c7f8XVk7kMW1ocCDHR3GuChil082+lyv8c5jFakOST
 Ga0MCmIJ0swXih7B1pCqgGxfKPFHk2SAsLvEdQcs9sGHPXm+EAUsWKiDMdT6TBTVpLQq
 nAlxKDN8FU4Wm5hU0MqAtk3LwqOH+GIqWKX/Xy/1Mno7lFuBsc/zcP2HmzmP3CKIKAU9
 OShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qsd9Joc7eUwkOZ4AJBpZWHOmVFjfsgrK79de1YKC/tQ=;
 b=dIJzOUxprLZaDtjhLJOcrFTS7R2n7RUs7ZzPLdrU842ryFIDEpoduzl9RlC7mE8SMh
 0/6GugLNnn5UhC9TlEFKYKYmOVWne16FzhGNx7iNNrmVHg2aeRfWha3Z0yEX0hf8ekzw
 NNLVy77NvzGPft6Lt7xTGgWI4BUmDvya1T/1a5a9Q9YwF62TaedFCrQnI9jgxy1RKKRj
 nqzf2adBCDvJUKMPGLmSqIOGJbRwA8soxzbdoUQbVJRFmaqft8HyPTIhjn2VZUS3jUtK
 PwnzIcuXu1BJydq1tXs9hApyCfS3aiZyxeMV/vwZ5gwz8Gs8LxYcOJnCzLlXZ42GMFL1
 JpBQ==
X-Gm-Message-State: AFqh2koazuoElFoWCL+tgrSlkfC00+6kiCxxM8ND1VCozZtLMAJZWUbM
 TeoLdscSV4moIujTBuVQbqf2iQ==
X-Google-Smtp-Source: AMrXdXujTUfMo190uOEXBGF12FepDT/G07SYOq7aQSbo8dOFYDmUOurPfRSbT/s6w6hbqBBfQoUWVQ==
X-Received: by 2002:a05:600c:3b91:b0:3d1:e710:98ec with SMTP id
 n17-20020a05600c3b9100b003d1e71098ecmr42017707wms.21.1672835572404; 
 Wed, 04 Jan 2023 04:32:52 -0800 (PST)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003d9980c5e7asm26931905wmq.21.2023.01.04.04.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 04:32:51 -0800 (PST)
Message-ID: <694949c8-f142-aee3-4741-84330f73f54a@linaro.org>
Date: Wed, 4 Jan 2023 13:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Alexander Graf <agraf@csgraf.de>, u-boot@lists.denx.de
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-10-agraf@csgraf.de>
Content-Language: fr
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230103215004.22646-10-agraf@csgraf.de>
Cc: u-boot-amlogic@groups.io, Matthias Brugger <mbrugger@suse.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v4 9/9] video: Enable VIDEO_DAMAGE for
 drivers that need it
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

TGUgMDMvMDEvMjAyMyDDoCAyMjo1MCwgQWxleGFuZGVyIEdyYWYgYSDDqWNyaXTCoDoKPiBTb21l
IGRyaXZlcnMgY2FsbCB2aWRlb19zZXRfZmx1c2hfZGNhY2hlKCkgdG8gaW5kaWNhdGUgdGhhdCB0
aGV5IHdhbnQgdG8KPiBoYXZlIHRoZSBkY2FjaGUgZmx1c2hlZCBmb3IgdGhlIGZyYW1lIGJ1ZmZl
ci4gVGhlc2UgZHJpdmVycyBiZW5lZml0IGZyb20KPiBvdXIgbmV3IHZpZGVvIGRhbWFnZSBjb250
cm9sLCBiZWNhdXNlIHdlIGNhbiByZWR1Y2UgdGhlIGFtb3VudCBvZiBtZW1vcnkKPiB0aGF0IGdl
dHMgZmx1c2hlZCBzaWduaWZpY2FudGx5Lgo+IAo+IFRoaXMgcGF0Y2ggZW5hYmxlcyB2aWRlbyBk
YW1hZ2UgY29udHJvbCBmb3IgYWxsIGRldmljZSBkcml2ZXJzIHRoYXQgY2FsbAo+IHZpZGVvX3Nl
dF9mbHVzaF9kY2FjaGUoKSB0byBtYWtlIHN1cmUgdGhleSBiZW5lZml0IGZyb20gaXQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEdyYWYgPGFncmFmQGNzZ3JhZi5kZT4KPiAtLS0KPiAg
IGFyY2gvYXJtL21hY2gtb21hcDIvb21hcDMvS2NvbmZpZyB8IDEgKwo+ICAgYXJjaC9hcm0vbWFj
aC1zdW54aS9LY29uZmlnICAgICAgIHwgMSArCj4gICBkcml2ZXJzL3ZpZGVvL0tjb25maWcgICAg
ICAgICAgICAgfCA5ICsrKysrKysrKwo+ICAgZHJpdmVycy92aWRlby9leHlub3MvS2NvbmZpZyAg
ICAgIHwgMSArCj4gICBkcml2ZXJzL3ZpZGVvL2lteC9LY29uZmlnICAgICAgICAgfCAxICsKPiAg
IGRyaXZlcnMvdmlkZW8vbWVzb24vS2NvbmZpZyAgICAgICB8IDEgKwo+ICAgZHJpdmVycy92aWRl
by9yb2NrY2hpcC9LY29uZmlnICAgIHwgMSArCj4gICBkcml2ZXJzL3ZpZGVvL3N0bTMyL0tjb25m
aWcgICAgICAgfCAxICsKPiAgIDggZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+IAoK
PHNuaXA+Cgo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vbWVzb24vS2NvbmZpZwo+ICsrKyBiL2RyaXZl
cnMvdmlkZW8vbWVzb24vS2NvbmZpZwo+IEBAIC04LDUgKzgsNiBAQCBjb25maWcgVklERU9fTUVT
T04KPiAgIAlib29sICJFbmFibGUgQW1sb2dpYyBNZXNvbiB2aWRlbyBzdXBwb3J0Igo+ICAgCWRl
cGVuZHMgb24gVklERU8KPiAgIAlzZWxlY3QgRElTUExBWQo+ICsJc2VsZWN0IFZJREVPX0RBTUFH
RQo+ICAgCWhlbHAKPiAgIAkgIEVuYWJsZSBBbWxvZ2ljIE1lc29uIFZpZGVvIFByb2Nlc3Npbmcg
VW5pdCB2aWRlbyBzdXBwb3J0LgoKRm9yIEFtbG9naWM6ClJldmlld2VkLWJ5OiBOZWlsIEFybXN0
cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KCjxzbmlwPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
