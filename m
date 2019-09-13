Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC5B1B2D
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 11:53:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59C1CC35E02
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 09:53:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A14AC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 09:48:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8D9jnX3018750; Fri, 13 Sep 2019 11:48:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=9Tnk3FiyfrkPcwTN/Tz2Xk6Sc7f+xqqnac/rli3/Y+Y=;
 b=l2daXwbjmtcTbfw/hMEg1C4KMG6aAQuvrkdYk83fQhjfXmt1USWz4u0/v1HqDWNTuDZd
 vCRNAJhW6lXZszH1VaTMRU8i+vwDt8Qdmfi3NIkIqEYvQwdhTcUf0IrkScYEq52xm3tW
 LJ/FciSpKM7Gb8ywJPR5bAxne9HbkZAnB7gErmTxxUEBq+tZWTmMB8KcWrU08M8f7obs
 /CYPj8igQM6PqcIZgRIhCnpy5kwkrHDKHVab3dZTSghLAWUQEnz18LELD/KYHqCkdSqR
 mvzLQoxDmkGFJ2H7s3uiFuitp7W7SS07W7FkdV4q/VaRSf5ljmtBVI1y5OYFBTX0FttF dw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uyte3v526-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 11:48:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DB0B44C;
 Fri, 13 Sep 2019 09:48:23 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FDB52BB882;
 Fri, 13 Sep 2019 11:48:23 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 11:48:23 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 11:48:22
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Vikas Manocha <vikas.manocha@st.com>, Benjamin Gaignard
 <benjamin.gaignard@st.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Jens Wiklander <jens.wiklander@linaro.org>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
Date: Fri, 13 Sep 2019 11:47:48 +0200
Message-ID: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_05:2019-09-11,2019-09-13 signatures=0
X-Mailman-Approved-At: Fri, 13 Sep 2019 09:53:41 +0000
Subject: [Uboot-stm32] [PATCH v4 00/15] splash screen on the stm32f769 &
	stm32mp1 boards
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

VmVyc2lvbiAxOgotIEluaXRpYWwgY29tbWl0LgoKVmVyc2lvbiAyOgotIHN3YXAgcGF0Y2hlcyB0
byBhdm9pZCBjb21waWxhdGlvbiBpc3N1ZS4KLSByZW1vdmUgcGFuZWwgdGltaW5ncyBmcm9tIGRl
dmljZSB0cmVlLgoKVmVyc2lvbiAzOgotIFNoYXJlIHNhbWUgaW5jbHVkZSBmaWxlIG1pcGlfZGlz
cGxheS5oIHdpdGgga2VybmVsIGxpbnV4LgotIFJld29yayBsdGRjIGRyaXZlciB3aXRoIGxhc3Qg
Y29tbWVudHMgb2YgQW5hdG9saWogR3VzdHNoaW4uCi0gQ2hlY2sgb3JkZXJpbmcgKGZpbGUgZHdf
bWlwaV9kc2kuYykuCi0gUmVuYW1lIG1pcGlfZGlzcGxheS5jIHRvIG1pcGlfZHNpLmMuCgpWZXJz
aW9uIDQ6Ci0gQWRkIHBoeXNpY2FsIHNldCBtb2RlIG9wZXJhdGlvbgotIEltcHJvdmUgZGVidWcg
dHJhY2UgKGRpc3BsYXkgY29udHJvbGxlciBsdGRjKQotIFJlZnJlc2ggdGltaW5ncyBvZiBwYW5l
bHMKLSBBZGQgcmVndWxhdG9yIChkc2kgY29udHJvbGxlcikKLSBBZGQgbmV3IGNsYXNzIERTSV9I
T1NUCi0gU3VwcG9ydCBvZiBwYW5lbHMgT1RNODAwQSAmIFJNNjgyMDAKClRoaXMgc2VyaWUgY29u
dGFpbnMgYWxsIHBhdGNoc2V0cyBuZWVkZWQgZm9yIGRpc3BsYXlpbmcgYSBzcGxhc2ggc2NyZWVu
Cm9uIHRoZSBzdG0zMmY3NjkgJiBzdG0zMm1wMSBib2FyZHMuCkEgbmV3IGNvbmZpZyBoYXMgYmVl
biBjcmVhdGVkIGNvbmZpZ3Mvc3RtMzJmNzY5LWRpc2NvX2RlZmNvbmZpZy4KVGhpcyBpcyBuZWNl
c3NhcnkgZHVlIHRvIHRoZSBkaWZmZXJlbmNlIG9mIHBhbmVscyBiZXR3ZWVuIHN0bTMyZjc2OS1k
aXNjbywKc3RtMzJmNzQ2LWRpc2NvIGJvYXJkcyAmIHN0bTMybXAxIGJvYXJkcy4KQSBuZXcgY2xh
c3MgRFNJX0hPU1QgaGF2ZSBiZWVuIGNyZWF0ZWQgdG8gbWFuYWdlIGEgZHNpIGhvc3QgYmV0d2Vl
biB0aGUKZHNpIGNvbnRyb2xsZXIgJiBkaXNwbGF5IGNvbnRyb2xsZXIuCgpZYW5uaWNrIEZlcnRy
w6kgKDE1KToKICB2aWRlbzogYm1wOiBjaGVjayByZXNvbHV0aW9ucyBvZiBwYW5lbC9iaXRtYXAK
ICB2aWRlbzogc3RtMzI6IHN0bTMyX2x0ZGM6IGFkZCBicmlkZ2UgdG8gZGlzcGxheSBjb250cm9s
bGVyCiAgaW5jbHVkZTogQWRkIG5ldyBEQ1MgY29tbWFuZHMgaW4gdGhlIGVudW0gbGlzdAogIHZp
ZGVvOiBhZGQgc3VwcG9ydCBvZiBNSVBJIERTSSBpbnRlcmZhY2UKICBkbTogQWRkIGEgZHNpIGhv
c3QgdWNsYXNzCiAgdmlkZW86IGFkZCBNSVBJIERTSSBob3N0IGNvbnRyb2xsZXIgYnJpZGdlCiAg
dmlkZW86IGFkZCBzdXBwb3J0IG9mIFNUTTMyIE1JUEkgRFNJIGNvbnRyb2xsZXIgZHJpdmVyCiAg
dmlkZW86IGFkZCBzdXBwb3J0IG9mIHBhbmVsIE9UTTgwMDlBCiAgdmlkZW86IGFkZCBzdXBwb3J0
IG9mIHBhbmVsIFJNNjgyMDAKICBib2FyZDogQWRkIFNUTTMyRjc2OSBTb0MsIGRpc2NvdmVyeSBi
b2FyZCBzdXBwb3J0CiAgQVJNOiBkdHM6IHN0bTMyZjc2OTogYWRkIGRpc3BsYXkgZm9yIFNUTTMy
Rjc2OSBkaXNjbyBib2FyZAogIEFSTTogZHRzOiBzdG0zMm1wMTogYWRkIGRzaSBob3N0IGZvciBz
dG0zMm1wMTU3Yy1ldjEgYm9hcmQKICBBUk06IGR0czogc3RtMzJtcDE6IGFkZCBkc2kgaG9zdCBm
b3Igc3RtMzJtcDE1N2MtZGsyIGJvYXJkCiAgc3RtMzJtcDE6IGNvbmZpZ3M6IHVwZGF0ZSB2aWRl
bwogIHN0bTMybXAxOiBjb25maWdzOiBhZGQgZGlzcGxheSBkZXZpY2VzCgogYXJjaC9hcm0vZHRz
L3N0bTMyZjc2OS1kaXNjby11LWJvb3QuZHRzaSB8ICA2MiArKysKIGFyY2gvYXJtL2R0cy9zdG0z
Mm1wMTU3Yy1kazItdS1ib290LmR0c2kgfCAgIDcgKwogYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdj
LWV2MS11LWJvb3QuZHRzaSB8ICAgNSArCiBhcmNoL3NhbmRib3gvZHRzL3NhbmRib3guZHRzICAg
ICAgICAgICAgIHwgICA2ICstCiBjb25maWdzL3NhbmRib3hfZGVmY29uZmlnICAgICAgICAgICAg
ICAgIHwgICAxICsKIGNvbmZpZ3Mvc3RtMzJmNzY5LWRpc2NvX2RlZmNvbmZpZyAgICAgICAgfCAg
NjMgKysrCiBjb25maWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25maWcgICAgICAgIHwgICA2ICsK
IGNvbmZpZ3Mvc3RtMzJtcDE1X29wdGVlX2RlZmNvbmZpZyAgICAgICAgfCAgIDYgKwogY29uZmln
cy9zdG0zMm1wMTVfdHJ1c3RlZF9kZWZjb25maWcgICAgICB8ICAgNiArCiBkcml2ZXJzL3ZpZGVv
L0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDQzICsrCiBkcml2ZXJzL3ZpZGVvL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIGRyaXZlcnMvdmlkZW8vZHNpLWhvc3QtdWNs
YXNzLmMgICAgICAgICAgfCAgMzkgKysKIGRyaXZlcnMvdmlkZW8vZHdfbWlwaV9kc2kuYyAgICAg
ICAgICAgICAgfCA4MzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy92
aWRlby9taXBpX2RzaS5jICAgICAgICAgICAgICAgICB8IDgyOCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIGRyaXZlcnMvdmlkZW8vb3Jpc2V0ZWNoX290bTgwMDlhLmMgICAgICAgfCAz
NzkgKysrKysrKysrKysrKysKIGRyaXZlcnMvdmlkZW8vcmF5ZGl1bS1ybTY4MjAwLmMgICAgICAg
ICAgfCAzNTEgKysrKysrKysrKysrKwogZHJpdmVycy92aWRlby9zYW5kYm94X2RzaV9ob3N0LmMg
ICAgICAgICB8ICA4MyArKysKIGRyaXZlcnMvdmlkZW8vc3RtMzIvS2NvbmZpZyAgICAgICAgICAg
ICAgfCAgIDkgKwogZHJpdmVycy92aWRlby9zdG0zMi9NYWtlZmlsZSAgICAgICAgICAgICB8ICAg
MSArCiBkcml2ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2RzaS5jICAgICAgICAgIHwgNDkwICsrKysr
KysrKysrKysrKysrKwogZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9sdGRjLmMgICAgICAgICB8
IDE0MyArKystLS0KIGRyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMgICAgICAgICAgICAgICAgfCAg
MTQgKwogaW5jbHVkZS9jb25maWdzL3N0bTMybXAxLmggICAgICAgICAgICAgICB8ICAgNyArCiBp
bmNsdWRlL2RtL3VjbGFzcy1pZC5oICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGluY2x1ZGUv
ZHNpX2hvc3QuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgNTcgKysrCiBpbmNsdWRlL21pcGlf
ZGlzcGxheS5oICAgICAgICAgICAgICAgICAgIHwgICA4ICsKIGluY2x1ZGUvbWlwaV9kc2kuaCAg
ICAgICAgICAgICAgICAgICAgICAgfCA0NjYgKysrKysrKysrKysrKysrKysKIHRlc3QvZG0vTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogdGVzdC9kbS9kc2lfaG9zdC5j
ICAgICAgICAgICAgICAgICAgICAgICB8ICA1OCArKysKIDI5IGZpbGVzIGNoYW5nZWQsIDM5MjMg
aW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmln
cy9zdG0zMmY3NjktZGlzY29fZGVmY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92
aWRlby9kc2ktaG9zdC11Y2xhc3MuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8v
ZHdfbWlwaV9kc2kuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vbWlwaV9kc2ku
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vb3Jpc2V0ZWNoX290bTgwMDlhLmMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpZGVvL3JheWRpdW0tcm02ODIwMC5jCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9zYW5kYm94X2RzaV9ob3N0LmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2RzaS5jCiBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9kc2lfaG9zdC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9taXBp
X2RzaS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdC9kbS9kc2lfaG9zdC5jCgotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0
bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vi
b290LXN0bTMyCg==
